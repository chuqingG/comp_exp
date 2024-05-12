#pragma once
#include "node.h"
// #include "../utils/config.h"
#include "../utils/compare.cpp"

#define NewPage() (new char[MAX_SIZE_IN_BYTES])
#define SetEmptyPage(p) memset(p, 0, sizeof(char) * MAX_SIZE_IN_BYTES)
#define BufTop(nptr) (nptr->base + nptr->space_top)

#define PageOffset(nptr, off) (char *)(nptr->base + off)

#define UpdateBase(node, newbase) \
    {                             \
        delete[] node->base;      \
        node->base = newbase;     \
    }

#define UpdatePtrs(node, newptrs, num)  \
    {                                   \
        for (int i = 0; i < num; i++)   \
            node->ptrs[i] = newptrs[i]; \
        node->ptr_cnt = num;            \
    }

#define InsertNode(nptr, pos, newnode)                         \
    {                                                          \
        nptr->ptrs.emplace(nptr->ptrs.begin() + pos, newnode); \
        nptr->ptr_cnt += 1;                                    \
    }
/*
================For standard==============
*/
#define UpdatePfxItem(nptr, addr, size, newallo)      \
    {                                                 \
        delete nptr->prefix;                          \
        nptr->prefix = new Item(addr, size, newallo); \
    }

#define GetHeaderStd(nptr, i) (Stdhead *)(nptr->base + MAX_SIZE_IN_BYTES - (i + 1) * sizeof(Stdhead))

inline void calculateBSMetaData(Node *node) {
    int n = node->size;
    uint16_t k = sizeof(uint16_t) * 8 - __builtin_clz(n) - 1;
    node->I = 1 << k;
    uint16_t l = sizeof(uint16_t) * 8 - __builtin_clz(n) - 1 + ((n & (n - 1)) ? 1 : 0);
    node->Ip = n + 1 - (1 << l);
}

inline void InsertKeyStd(Node *nptr, int pos, const char *k, uint16_t klen) {
    // shift the headers
    for (int i = nptr->size; i > pos; i--) {
        memcpy(GetHeaderStd(nptr, i), GetHeaderStd(nptr, i - 1), sizeof(Stdhead));
    }
    // Set the new header
    Stdhead *header = GetHeaderStd(nptr, pos);
    header->key_offset = nptr->space_top;
    #ifdef PV
        if (klen > PV_SIZE) {
            strcpy(BufTop(nptr), k + PV_SIZE);
            nptr->space_top += klen - PV_SIZE + 1;
        }
        else {
            strcpy(BufTop(nptr), "\0");
            nptr->space_top += 1;
        }
        memset(header->key_prefix, 0, PV_SIZE);
        strncpy(header->key_prefix, k, min(PV_SIZE, (int)klen));
    #else
        strcpy(BufTop(nptr), k);
        nptr->space_top += klen + 1;
    #endif

    header->key_len = klen;
    nptr->size += 1;
#ifdef UBS
    calculateBSMetaData(nptr);
#endif
}

// TODO:
inline void RemoveKeyStd(Node *nptr, int pos, const char *k, uint16_t klen) {
    strcpy(BufTop(nptr), k);
    // shift the headers
    for (int i = nptr->size; i > pos; i--) {
        memcpy(GetHeaderStd(nptr, i), GetHeaderStd(nptr, i - 1), sizeof(Stdhead));
    }
    // Set the new header
    Stdhead *header = GetHeaderStd(nptr, pos);
    header->key_offset = nptr->space_top;
    header->key_len = klen;
    nptr->space_top += klen + 1;
    nptr->size += 1;
}

// with cutoff
inline void CopyToNewPageStd(Node *nptr, int low, int high, char *newbase, uint16_t cutoff, uint16_t &top) {//cutoff is potential head_comp ignored bytes
    for (int i = low; i < high; i++) {
        int newidx = i - low;
        Stdhead *oldhead = GetHeaderStd(nptr, i);
        Stdhead *newhead = (Stdhead *)(newbase + MAX_SIZE_IN_BYTES
                                       - (newidx + 1) * sizeof(Stdhead));
        int key_len = oldhead->key_len;
        #ifdef PV
            char *presuf = new char[oldhead->key_len + 1]; //extract entire key
            presuf[oldhead->key_len + 1] = '\0';
            strncpy(presuf, oldhead->key_prefix, PV_SIZE);
            strncpy(presuf + PV_SIZE, PageOffset(nptr, oldhead->key_offset), oldhead->key_len < PV_SIZE ? 0 :  oldhead->key_len);

            newhead->key_len = oldhead->key_len - cutoff;
            newhead->key_offset = top;
            memset(newhead->key_prefix, 0, PV_SIZE); //cutoff can't be longer than length right? yes
            strncpy(newhead->key_prefix, presuf + cutoff, min(PV_SIZE, (int)newhead->key_len));

            int sufLength = oldhead->key_len - cutoff - PV_SIZE; if (sufLength < 0) sufLength = 0;
            strncpy(newbase + top, presuf + cutoff + PV_SIZE, sufLength); //ends at nullbyte, even if 0
            top += sufLength + 1; //if key can fit into prefix, then there will be a null_byte place holder
            delete[] presuf;
        #else
            strcpy(BufTop(nptr), k);
            strcpy(newbase + top, PageOffset(nptr, oldhead->key_offset) + cutoff);
            newhead->key_len = oldhead->key_len - cutoff;
            newhead->key_offset = top;
            top += newhead->key_len + 1;
        #endif
        // if (newhead->key_len > 32)
        //     cout << "wrong update" << endl;
    }
}

#ifdef PV
inline long word_cmp(Stdhead* header,const char* key, int keylen) {
    // char word[8] = {0};
    // char prefix[8] = {0};
    // for (int i = 0; i < PV_SIZE; i++) 
    //     prefix[i] = header->key_prefix[PV_SIZE - 1 - i];
    // for (int i = 0; i < min(keylen, PV_SIZE); i++)
    //     word[i] = key[min(keylen, PV_SIZE) - 1 - i];
    // return *(long*)word - *(long*)prefix;
    int cmp_len = min(PV_SIZE, keylen);
    // int idx = *matchp;
    for (int idx = 0; idx < cmp_len; ++idx) {
        int cmp = key[idx] - header->key_prefix[idx];
        if (cmp != 0)
            return cmp;
    }
    /* Contents are equal up to the smallest length. */
    return 0;
}

inline long pvComp(Stdhead* header,const char* key, int keylen, Node *cursor) {
    long cmp = word_cmp(header, key, keylen);
    if (cmp == 0) {
        cmp = char_cmp_new(key, PageOffset(cursor, header->key_offset),
                            keylen, header->key_len);
    }
    return cmp;
}
#endif
inline int unrolledBinarySearch(Node *cursor, const char *key, int keylen, long &cmp) {//cutoff is potential head_comp ignored bytes
    int curPos = cursor->I; //2^k, where k is floor(log cursor->size);
    Stdhead *ki = GetHeaderStd(cursor, curPos);
    uint16_t delta = cursor->I;

    cmp = pvComp(ki, key, keylen, cursor); //initial probe cost
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) { //if K > Ki
            curPos = cursor->Ip;
            curPos += delta;
    }
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //2
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //3
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //4
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //5
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //6
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //7
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //8
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    ki = GetHeaderStd(cursor, curPos); //9
    cmp = pvComp(ki, key, keylen, cursor); 
    delta = delta << 1;
    if (cmp == 0 || delta == 0) return curPos;
    else if (cmp > 0) curPos += delta;
    else curPos -= delta;

    cout << "Unrolled Binary Search Exceeds Upperbound";
    return curPos;
}


/*
===============For DB2=============
*/
#define NewPageDB2() (new char[MAX_SIZE_IN_BYTES + DB2_PFX_MAX_SIZE])
#define SetEmptyPageDB2(p) memset(p, 0, sizeof(char) * (MAX_SIZE_IN_BYTES + DB2_PFX_MAX_SIZE))

#define GetKeyDB2(result, off) (char *)(result->base + off)
#define GetPfxDB2(result, off) (char *)(result->base + MAX_SIZE_IN_BYTES + off)
#define GetHeaderInPageDB2(result, i) (DB2head *)(result->base + MAX_SIZE_IN_BYTES - (i + 1) * sizeof(DB2head))
#define GetPfxInPageDB2(result, i) (DB2pfxhead *)(result->base + (MAX_SIZE_IN_BYTES + DB2_PFX_MAX_SIZE) - (i + 1) * sizeof(DB2pfxhead))

#define PfxTop(nptr) (nptr->base + MAX_SIZE_IN_BYTES + nptr->pfx_top)

#define GetHeaderDB2(nptr, i) (DB2head *)(nptr->base + MAX_SIZE_IN_BYTES - (i + 1) * sizeof(DB2head))

#define GetHeaderDB2pfx(nptr, i) (DB2pfxhead *)(nptr->base + MAX_SIZE_IN_BYTES + DB2_PFX_MAX_SIZE - (i + 1) * sizeof(DB2pfxhead))

#define PfxOffset(node, off) (char *)(node->base + MAX_SIZE_IN_BYTES + off)

inline void InsertPfxDB2(NodeDB2 *nptr, int pos, const char *p, uint16_t plen, uint16_t low, uint16_t high) {
    char *temp = PfxTop(nptr);
    memcpy(temp, p, sizeof(char) * plen);
    temp[plen] = '\0';
    // shift the headers
    for (int i = nptr->pfx_size; i > pos; i--) {
        memcpy(GetHeaderDB2pfx(nptr, i), GetHeaderDB2pfx(nptr, i - 1), sizeof(DB2pfxhead));
    }
    // Set the new header
    DB2pfxhead *header = GetHeaderDB2pfx(nptr, pos);
    header->pfx_offset = nptr->pfx_top;
    header->pfx_len = plen;
    header->low = low;
    header->high = high;
    nptr->pfx_top += plen + 1;
    nptr->pfx_size += 1;
}

inline void InsertKeyDB2(NodeDB2 *nptr, int pos, const char *k, uint16_t klen) {
    strcpy(BufTop(nptr), k);
    // shift the headers
    for (int i = nptr->size; i > pos; i--) {
        memcpy(GetHeaderDB2(nptr, i), GetHeaderDB2(nptr, i - 1), sizeof(DB2head));
    }
    // Set the new header
    DB2head *header = GetHeaderDB2(nptr, pos);
    header->key_offset = nptr->space_top;
    header->key_len = klen;
    nptr->space_top += klen + 1;
    nptr->size += 1;
}

inline void CopyToNewPageDB2(NodeDB2 *nptr, int low, int high, char *newbase, uint16_t &top) {
    for (int i = low; i < high; i++) {
        int newidx = i - low;
        DB2head *oldhead = GetHeaderDB2(nptr, i);
        DB2head *newhead = (DB2head *)(newbase + MAX_SIZE_IN_BYTES
                                       - (newidx + 1) * sizeof(DB2head));
        strncpy(newbase + top, PageOffset(nptr, oldhead->key_offset), oldhead->key_len);
        newhead->key_len = oldhead->key_len;
        newhead->key_offset = top;
        top += oldhead->key_len + 1;
    }
}

// for a single base without a node scope
#define WriteKeyDB2Page(base, memusage, pos, k, klen, plen)                                     \
    {                                                                                           \
        strcpy(base + memusage, k + plen);                                                      \
        DB2head *head = (DB2head *)(newbase + MAX_SIZE_IN_BYTES - (pos + 1) * sizeof(DB2head)); \
        head->key_len = klen - plen;                                                            \
        head->key_offset = memusage;                                                            \
        memusage += head->key_len + 1;                                                          \
    }

// Only write to the end of prefix page
// the input pfxbase mush be based on node->base + max_size_in_byte
#define WritePfxDB2Page(base, pfxtop, pfxitem, pfxsize)                                                                      \
    {                                                                                                                        \
        strcpy(base + MAX_SIZE_IN_BYTES + pfxtop, pfxitem.prefix.addr);                                                      \
        DB2pfxhead *head = (DB2pfxhead *)(base + MAX_SIZE_IN_BYTES + DB2_PFX_MAX_SIZE - (pfxsize + 1) * sizeof(DB2pfxhead)); \
        head->pfx_offset = pfx_top;                                                                                          \
        head->pfx_len = pfxitem.prefix.size;                                                                                 \
        head->low = pfxitem.low;                                                                                             \
        head->high = pfxitem.high;                                                                                           \
        pfxtop += pfxitem.prefix.size + 1;                                                                                   \
        pfxsize++;                                                                                                           \
    }
/*
===============For WiredTiger=============
*/

// Get the ith header, i starts at 0
#define GetHeaderWT(nptr, i) (WThead *)(nptr->base + MAX_SIZE_IN_BYTES - (i + 1) * sizeof(WThead))

// The prefix should be cutoff before calling this
inline void InsertKeyWT(NodeWT *nptr, int pos, const char *k, int klen, int plen) {
    strcpy(BufTop(nptr), k);
    // shift the headers
    for (int i = nptr->size; i > pos; i--) {
        memcpy(GetHeaderWT(nptr, i), GetHeaderWT(nptr, i - 1), sizeof(WThead));
    }
    // Set the new header
    WThead *header = GetHeaderWT(nptr, pos);
    header->key_offset = nptr->space_top;
    header->key_len = (uint16_t)klen;
    header->pfx_len = (uint16_t)plen;
#ifdef WTCACHE
    header->initialized = false;
#endif
    nptr->space_top += klen + 1;
    nptr->size += 1;
}

inline void CopyToNewPageWT(NodeWT *nptr, int low, int high, char *newbase, int &top) {
    for (int i = low; i < high; i++) {
        int newidx = i - low;
        WThead *oldhead = GetHeaderWT(nptr, i);
        WThead *newhead = (WThead *)(newbase + MAX_SIZE_IN_BYTES
                                     - (newidx + 1) * sizeof(WThead));
        strncpy(newbase + top, PageOffset(nptr, oldhead->key_offset), oldhead->key_len);
        newhead->key_len = (uint16_t)oldhead->key_len;
        newhead->key_offset = top;
        newhead->pfx_len = (uint16_t)oldhead->pfx_len;
        top += oldhead->key_len + 1;
    }
}

#define GetHeaderMyISAM(nptr, i) (MyISAMhead *)(nptr->base + MAX_SIZE_IN_BYTES - (i + 1) * sizeof(MyISAMhead))

inline void InsertKeyMyISAM(NodeMyISAM *nptr, int pos, const char *k, int klen, int plen) {
    strcpy(BufTop(nptr), k);
    // shift the headers
    for (int i = nptr->size; i > pos; i--) {
        memcpy(GetHeaderMyISAM(nptr, i), GetHeaderMyISAM(nptr, i - 1), sizeof(MyISAMhead));
    }
    // Set the new header
    MyISAMhead *header = GetHeaderMyISAM(nptr, pos);
    header->key_offset = nptr->space_top;
    header->key_len = (uint16_t)klen;
    header->pfx_len = (uint16_t)plen;
    nptr->space_top += klen + 1;
    nptr->size += 1;
}

inline void CopyToNewPageMyISAM(NodeMyISAM *nptr, int low, int high, char *newbase, int &top) {
    for (int i = low; i < high; i++) {
        int newidx = i - low;
        MyISAMhead *oldhead = GetHeaderMyISAM(nptr, i);
        MyISAMhead *newhead = (MyISAMhead *)(newbase + MAX_SIZE_IN_BYTES
                                             - (newidx + 1) * sizeof(MyISAMhead));
        strncpy(newbase + top, PageOffset(nptr, oldhead->key_offset), oldhead->key_len);
        newhead->key_len = (uint16_t)oldhead->key_len;
        newhead->key_offset = top;
        newhead->pfx_len = (uint16_t)oldhead->pfx_len;
        top += oldhead->key_len + 1;
    }
}

#define GetHeaderPkB(nptr, i) (PkBhead *)(nptr->base + MAX_SIZE_IN_BYTES - (i + 1) * sizeof(PkBhead))

// the k and klen here should always be the fullkey
inline void InsertKeyPkB(NodePkB *nptr, int pos, const char *k, uint16_t klen, uint16_t plen) {
    strcpy(BufTop(nptr), k);
    // shift the headers
    for (int i = nptr->size; i > pos; i--) {
        memcpy(GetHeaderPkB(nptr, i), GetHeaderPkB(nptr, i - 1), sizeof(PkBhead));
    }
    // Set the new header
    PkBhead *header = GetHeaderPkB(nptr, pos);
    header->key_offset = nptr->space_top;
    header->key_len = klen;
    header->pfx_len = plen;
    if (plen < klen) {
        int pk_len = min(klen - plen, PKB_LEN);
        strncpy(header->pk, k + plen, pk_len);
        header->pk[pk_len] = '\0';
        header->pk_len = pk_len;
    }
    else {
        memset(header->pk, 0, sizeof(header->pk));
        header->pk_len = 0;
    }

    nptr->space_top += klen + 1;
    nptr->size += 1;
}

inline void CopyToNewPagePkB(NodePkB *nptr, int low, int high, char *newbase, int &top) {
    for (int i = low; i < high; i++) {
        int newidx = i - low;
        PkBhead *oldhead = GetHeaderPkB(nptr, i);
        PkBhead *newhead = (PkBhead *)(newbase + MAX_SIZE_IN_BYTES
                                       - (newidx + 1) * sizeof(PkBhead));
        strncpy(newbase + top, PageOffset(nptr, oldhead->key_offset), oldhead->key_len);
        memcpy(newhead, oldhead, sizeof(PkBhead));
        // offset is different
        newhead->key_offset = top;
        top += oldhead->key_len + 1;
    }
}
// Re-implementations of non-standard MSVC functions
// Made slightly trickier by the fact that MSVC doesn't even support them
// any more and has dropped documentation for them.

#include <cctype>

// http://www.qnx.com/developers/docs/6.5.0/index.jsp?topic=%2Fcom.qnx.doc.neutrino_lib_ref%2Fs%2Fstrlwr.html
char* strlwr(char *s) {
    char *ptr = s;
    while (*ptr) {
        *ptr = tolower(*ptr);
        ++ptr;
    }

    return s;
}

// http://www.qnx.com/developers/docs/6.5.0/index.jsp?topic=%2Fcom.qnx.doc.neutrino_lib_ref%2Fs%2Fstrupr.html
char* strupr(char *s) {
    char *ptr = s;
    while (*ptr) {
        *ptr = tolower(*ptr);
        ++ptr;
    }

    return s;
}

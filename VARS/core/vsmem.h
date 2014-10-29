/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#ifndef vsmem_h
#define vsmem_h

#ifdef __OBJC__
#if __has_feature(objc_arc)
#define vs_dealloc(nsobj_pointer) nsobj_pointer = nil
#else
#define vs_dealloc(nsobj_pointer) if (nsobj_pointer != nil) { [nsobj_pointer release]; nsobj_pointer = nil; }
#endif // __has_feature(objc_arc)
#endif // __OBJC__

#endif

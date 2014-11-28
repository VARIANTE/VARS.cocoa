/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#ifndef vsdebug_h
#define vsdebug_h

#ifdef __OBJC__
#ifdef DEBUG
#define vs_log(format, ...) NSLog(format, ## __VA_ARGS__)
#define vs_nfassert(condition, format, ...) if (!condition) vs_log(format, ## __VA_ARGS__)
#define vs_fassert(condition, description, ...) NSAssert(condition, description, ## __VA_ARGS__)
#else
#define vs_log(format, ...)
#define vs_nfassert(condition, format, ...)
#define vs_fassert(condition, description, ...)
#endif // DEBUG
#endif // __OBJC__

#endif // vsdebug_h

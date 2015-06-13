/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <float.h>
#import <locale.h>
#import <math.h>
#import <stdlib.h>
#import <xlocale.h>

#import "vsmath.h"

#pragma mark - Trigonometry
#pragma mark Angle Conversions

/**
 *  @inheritDoc
 */
float fdtorf(float __n)
{
    float o = __n * (M_PI/180.0f);

    return o;
}

/**
 *  @inheritDoc
 */
double fdtor(double __n)
{
    double o = __n * (M_PI/180.0);

    return o;
}

/**
 *  @inheritDoc
 */
float fdtogf(float __n)
{
    float o = __n * (10.0f/9.0f);

    return o;
}

/**
 *  @inheritDoc
 */
double fdtog(double __n)
{
    double o = __n * (10.0/9.0);

    return o;
}

/**
 *  @inheritDoc
 */
float frtodf(float __n)
{
    float o = __n * (180.0f/M_PI);

    return o;
}

/**
 *  @inheritDoc
 */
double frtod(double __n)
{
    double o = __n * (180.0/M_PI);

    return o;
}

/**
 *  @inheritDoc
 */
float frtogf(float __n)
{
    float o = __n * (200.0f/M_PI);

    return o;
}

/**
 *  @inheritDoc
 */
double frtog(double __n)
{
    double o = __n * (200.0/M_PI);

    return o;
}

/**
 *  @inheritDoc
 */
float fgtodf(float __n)
{
    float o = __n * (9.0f/10.0f);

    return o;
}

/**
 *  @inheritDoc
 */
double fgtod(double __n)
{
    double o = __n * (9.0/10.0);

    return o;
}

/**
 *  @inheritDoc
 */
float fgtorf(float __n)
{
    float o = __n * (M_PI/200.0f);

    return o;
}

/**
 *  @inheritDoc
 */
double fgtor(double __n)
{
    double o = __n * (M_PI/200.0);

    return o;
}

#pragma mark Trigonometric Functions

/**
 *  @inheritDoc
 */
float fsindf(float __n)
{
    float o = fsinrf(fdtorf(__n));

    return o;
}

/**
 *  @inheritDoc
 */
double fsind(double __n)
{
    double o = fsinr(fdtor(__n));

    return o;
}

/**
 *  @inheritDoc
 */
float fcosdf(float __n)
{
    float o = fcosrf(fdtorf(__n));

    return o;
}

/**
 *  @inheritDoc
 */
double fcosd(double __n)
{
    double o = fcosr(fdtor(__n));

    return o;
}

/**
 *  @inheritDoc
 */
float ftandf(float __n)
{
    float o = ftanrf(fdtorf(__n));

    return o;
}

/**
 *  @inheritDoc
 */
double ftand(double __n)
{
    double o = ftanr(fdtor(__n));

    return o;
}

/**
 *  @inheritDoc
 */
float fsinrf(float __n)
{
    float o = sinf(__n);

    if ((1.0f - fabsf(o)) < FLT_EPSILON)
    {
        return roundf(o);
    }
    else if (fabs(o) < FLT_EPSILON)
    {
        return 0.0f;
    }
    else
    {
        return o;
    }
}

/**
 *  @inheritDoc
 */
double fsinr(double __n)
{
    double o = sin(__n);

    if ((1.0 - fabs(o)) < FLT_EPSILON)
    {
        return round(o);
    }
    else if (fabs(o) < FLT_EPSILON)
    {
        return 0.0;
    }
    else
    {
        return o;
    }
}

/**
 *  @inheritDoc
 */
float fcosrf(float __n)
{
    float o = cosf(__n);

    if (fabsf(o) < FLT_EPSILON)
    {
        return 0.0f;
    }
    else
    {
        return o;
    }
}

/**
 *  @inheritDoc
 */
double fcosr(double __n)
{
    double o = cos(__n);

    if (fabs(o) < FLT_EPSILON)
    {
        return 0.0;
    }
    else
    {
        return o;
    }
}

/**
 *  @inheritDoc
 */
float ftanrf(float __n)
{
    float o;

    if (fcosrf(__n) == 0.0f)
    {
        o = NAN;
    }
    else
    {
        o = tanf(__n);
    }

    if (fabsf(o) < FLT_EPSILON)
    {
        o = 0.0f;
    }

    return o;
}

/**
 *  @inheritDoc
 */
double ftanr(double __n)
{
    double o;

    if (fcosr(__n) == 0.0)
    {
        o = NAN;
    }
    else
    {
        o = tan(__n);
    }

    if (fabs(o) < FLT_EPSILON)
    {
        o = 0.0;
    }

    return o;
}

/**
 *  @inheritDoc
 */
float fsingf(float __n)
{
    float o = fsinrf(fgtorf(__n));

    return o;
}

/**
 *  @inheritDoc
 */
double fsing(double __n)
{
    double o = fsinr(fgtor(__n));

    return o;
}

/**
 *  @inheritDoc
 */
float fcosgf(float __n)
{
    float o = fcosrf(fgtorf(__n));

    return o;
}

/**
 *  @inheritDoc
 */
double fcosg(double __n)
{
    double o = fcosr(fgtor(__n));

    return o;
}

/**
 *  @inheritDoc
 */
float ftangf(float __n)
{
    float o = ftanrf(fgtorf(__n));

    return o;
}

/**
 *  @inheritDoc
 */
double ftang(double __n)
{
    double o = ftanr(fgtor(__n));
    
    return o;
}

#pragma mark - Differential Calculus

/**
 *  @inheritDoc
 */
float fslopef(float __x1, float __x2, float __y1, float __y2)
{
    if (isnan(__x1) || isnan(__x2) || isnan(__y1) || isnan(__y2))
    {
        return NAN;
    }

    if (fabsf(__y2 - __y1) < FLT_EPSILON)
    {
        return 0.0f;
    }

    if (fabsf(__x2 - __x1) < FLT_EPSILON)
    {
        return NAN;
    }

    return ((__y2 - __y1) / (__x2 - __x1));
}

/**
 *  @inheritDoc
 */
double fslope(double __x1, double __x2, double __y1, double __y2)
{
    if (isnan(__x1) || isnan(__x2) || isnan(__y1) || isnan(__y2))
    {
        return NAN;
    }

    if (fabs(__y2 - __y1) < DBL_EPSILON)
    {
        return 0.0;
    }

    if (fabs(__x2 - __x1) < DBL_EPSILON)
    {
        return NAN;
    }

    return ((__y2 - __y1) / (__x2 - __x1));
}

#pragma mark - Logarithms

/**
 *  @inheritDoc
 */
float flnf(float __n)
{
    float o = log10f(__n) / log10f(M_E);

    return o;
}

/**
 *  @inheritDoc
 */
double fln(double __n)
{
    double o = log10(__n) / log10(M_E);

    return o;
}

#pragma mark - Probability

/**
 *  @inheritDoc
 */
float ffactf(float __n)
{
    float o = NAN;

    if (__n == 0.0f)
    {
        o = 1.0f;
    }
    else if (__n < 0.0f)
    {
        // If negative integer, return NAN.
        if (fisintf(__n) == 1)
        {
            o = NAN;
        }
        // Else compute the factorial of negative non-integers.
        else
        {
            o = tgammaf(__n + 1.0f);
        }
    }
    else
    {
        // Positive integer.
        if (fisintf(__n) == 1)
        {
            o = roundf(expf(lgammaf(__n + 1.0f)));
        }
        // Positive natural number.
        else
        {
            o = tgammaf(__n + 1.0f);
        }
    }

    return o;
}

/**
 *  @inheritDoc
 */
double ffact(double __n)
{
    double o = NAN;

    if (__n == 0.0)
    {
        o = 1.0;
    }
    else if (__n < 0.0)
    {
        // Negative integer.
        if (fisint(__n) == 1)
        {
            o = NAN;
        }
        // Negative non-integer.
        else
        {
            o = tgamma(__n + 1.0);
        }
    }
    else
    {
        // Positive integer.
        if (fisint(__n) == 1)
        {
            o = round(exp(lgamma(__n + 1.0)));
        }
        // Positive non-integer.
        else
        {
            o = tgamma(__n + 1.0);
        }
    }

    return o;
}

/**
 *  @inheritDoc
 */
float fncrf(float __n, float __r)
{
    float o = 1.0f;

    // If n and r are a positive integers, compute the binomial coefficient.
    if (fisintf(__n) && __n >= 0.0f && fisintf(__r) && __r >= 0.0f)
    {
        // Binomial coefficient properties.
        if (__n == __r)      return 1.0f;
        if (__r == 0.0f)     return 1.0f;
        if (__r == 1.0f)     return __n;
        if (__r == __n-1.0f) return __n;
        if (__r > __n)       return 0.0f;
        if (__r == 2.0f)     return __n*(__n-1.0f)/2.0f;

        // Use approximation approach if n-r is too large.
        if (__n-__r > 1E7)
        {
            int simplified = 0;

            if (simplified)
            {
                // Stirling's approximation: log(n!) ≈ nlog(n)-n
                // Factorial representation of the binomial coefficient: n!/r!(n-r)!
                // Derivation:
                //      C(n,r) = n!/r!(n-r)!
                // log(C(n,r)) = log(n!/r!(n-r)!)
                // log(C(n,r)) = log(n!) - log(r!) - log((n-r)!)
                // log(C(n,r)) ≈ (nlog(n)-n) - (rlog(r)-r) - ((n-r)log(n-r)-(n-r))
                // log(C(n,r)) ≈ nlog(n)-n - rlog(r)+r - (n-r)log(n-r)+n-r
                // log(C(n,r)) ≈ nlog(n) - rlog(r) - (n-r)log(n-r)
                //      C(n,r) ≈ 10^(nlog(n) - rlog(r) - (n-r)log(n-r))
                float a = __n * log10f(__n);
                float b = __r * log10f(__r);
                float c = (__n-__r) * log10f(__n-__r);

                o = a-c-b; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0f)
                {
                    o = NAN;
                }
                else
                {
                    o = powf(10.0f, o);
                }
            }
            else
            {
                // A better approximation that incorporates Stirling's approximation: log(n!) ≈ (n+0.5)log(n)-n+0.5log(2π)
                // Factorial representation of the binomial coefficient: n!/r!(n-r)!
                // Derivation:
                //      C(n,r) = n!/r!(n-r)!
                // log(C(n,r)) = log(n!/r!(n-r)!)
                // log(C(n,r)) = log(n!) - log(r!) - log((n-r)!)
                // log(C(n,r)) ≈ (n+0.5)log(n)-n+0.5log(2π) - (r+0.5)log(r)+r-0.5log(2π) - ((n-r)+0.5)log(n-r)+(n-r)-0.5log(2π)
                // log(C(n,r)) ≈ (n+0.5)log(n) - (r+0.5)log(r) - (n-r+0.5)log(n-r) - 0.5log(2π)
                //      C(n,r) ≈ 10^((n+0.5)log(n) - (r+0.5)log(r) - (n-r+0.5)log(n-r) - 0.5log(2π))
                float a = (__n+0.5f)*log10f(__n);
                float b = (__r+0.5f)*log10f(__r);
                float c = (__n-__r+0.5)*log10f(__n-__r);
                float d = 0.5f*log10f(2.0f*M_PI);

                o = a-c-b-d; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0f)
                {
                    o = NAN;
                }
                else
                {
                    o = powf(10.0f, o);
                }
            }
        }
        // Standard approach.
        else
        {
            // Factorial representation of the binomial coefficient: n!/r!(n-r)!
            // Derivation:
            // C(n,r) = n!/r!(n-r)!
            //        = (1*2*...*n) / (1*2*...*r) * (1*2*...*(n-r))
            //        = ((r+1)*(r+2)*...*n) / (1*2*...*(n-r))
            //        = ((r+1)*(r+2)*...*(r+n-r)) / (1*2*...*(n-r))
            //        = (r+1)/1 * (r+2)/2 * ... * (r+n-r)/(n-r)
            //        = Π(i=1, n-r) (r+i)/i
            //        = Π(i=1, n-r) 1+r/i
            if (__n-__r < __r)
            {
                for (int i = 1; i <= __n -__r; i++)
                {
                    o *= 1.0f + __r/i;
                }
            }
            else
            {
                for (int i = 1; i <= __r; i++)
                {
                    o *= 1.0f + (__n-__r)/i;
                }
            }
        }

        return o;
    }
    // Else we are dealing with complex numbers, gamma function is needed.
    else
    {
        // Recall Γ(n) = (n-1)!, therefore Γ(n+1) = n!. Also, nCr = n!/r!(n-r)!.
        // Factorial representation of the binomial coefficient: n!/r!(n-r)!
        float a = lgammaf(__n+1.0f); // ln(n!)
        float b = lgammaf(__r+1.0f); // ln(r!)
        float c = lgammaf(__n-__r+1.0f); // ln((n-r))!

        o = a-c-b; // Due to precision issues, order from likelihood of largest to smallest.
        o = expf(o);
    }
    
    return o;
}

/**
 *  @inheritDoc
 */
double fncr(double __n, double __r)
{
    double o = 1.0;

    // If n and r are a positive integers, compute the binomial coefficient.
    if (fisint(__n) && __n >= 0.0 && fisint(__r) && __r >= 0.0)
    {
        // Binomial coefficient properties.
        if (__n == __r)     return 1.0;
        if (__r == 0.0)     return 1.0;
        if (__r == 1.0)     return __n;
        if (__r == __n-1.0) return __n;
        if (__r > __n)      return 0.0;
        if (__r == 2.0)     return __n*(__n-1.0)/2.0;

        // Use approximation approach if n-r is too large.
        if (__n-__r > 1E7)
        {
            int simplified = 0;

            if (simplified)
            {
                // Stirling's approximation: log(n!) ≈ nlog(n)-n
                // Factorial representation of the binomial coefficient: n!/r!(n-r)!
                // Derivation:
                //      C(n,r) = n!/r!(n-r)!
                // log(C(n,r)) = log(n!/r!(n-r)!)
                // log(C(n,r)) = log(n!) - log(r!) - log((n-r)!)
                // log(C(n,r)) ≈ (nlog(n)-n) - (rlog(r)-r) - ((n-r)log(n-r)-(n-r))
                // log(C(n,r)) ≈ nlog(n)-n - rlog(r)+r - (n-r)log(n-r)+n-r
                // log(C(n,r)) ≈ nlog(n) - rlog(r) - (n-r)log(n-r)
                //      C(n,r) ≈ 10^(nlog(n) - rlog(r) - (n-r)log(n-r))
                double a = __n * log10(__n);
                double b = __r * log10(__r);
                double c = (__n-__r) * log10(__n-__r);

                o = a-c-b; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0)
                {
                    o = NAN;
                }
                else
                {
                    o = fpow(10.0, o);
                }
            }
            else
            {
                // A better approximation that incorporates Stirling's approximation: log(n!) ≈ (n+0.5)log(n)-n+0.5log(2π)
                // Factorial representation of the binomial coefficient: n!/r!(n-r)!
                // Derivation:
                //      C(n,r) = n!/r!(n-r)!
                // log(C(n,r)) = log(n!/r!(n-r)!)
                // log(C(n,r)) = log(n!) - log(r!) - log((n-r)!)
                // log(C(n,r)) ≈ (n+0.5)log(n)-n+0.5log(2π) - (r+0.5)log(r)+r-0.5log(2π) - ((n-r)+0.5)log(n-r)+(n-r)-0.5log(2π)
                // log(C(n,r)) ≈ (n+0.5)log(n) - (r+0.5)log(r) - (n-r+0.5)log(n-r) - 0.5log(2π)
                //      C(n,r) ≈ 10^((n+0.5)log(n) - (r+0.5)log(r) - (n-r+0.5)log(n-r) - 0.5log(2π))
                double a = (__n+0.5)*log10(__n);
                double b = (__r+0.5)*log10(__r);
                double c = (__n-__r+0.5)*log10(__n-__r);
                double d = 0.5*log10(2.0*M_PI);

                o = a-c-b-d; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0)
                {
                    o = NAN;
                }
                else
                {
                    o = fpow(10.0, o);
                }
            }
        }
        // Standard approach.
        else
        {
            // Factorial representation of the binomial coefficient: n!/r!(n-r)!
            // Derivation:
            // C(n,r) = n!/r!(n-r)!
            //        = (1*2*...*n) / (1*2*...*r) * (1*2*...*(n-r))
            //        = ((r+1)*(r+2)*...*n) / (1*2*...*(n-r))
            //        = ((r+1)*(r+2)*...*(r+n-r)) / (1*2*...*(n-r))
            //        = (r+1)/1 * (r+2)/2 * ... * (r+n-r)/(n-r)
            //        = Π(i=1, n-r) (r+i)/i
            //        = Π(i=1, n-r) 1+r/i
            if (__n-__r < __r)
            {
                for (int i = 1; i <= __n -__r; i++)
                {
                    o *= 1.0 + __r/i;
                }
            }
            else
            {
                for (int i = 1; i <= __r; i++)
                {
                    o *= 1.0 + (__n-__r)/i;
                }
            }
        }

        return o;
    }
    // Else we are dealing with complex numbers, gamma function is needed.
    else
    {
        // Recall Γ(n) = (n-1)!, therefore Γ(n+1) = n!. Also, nCr = n!/r!(n-r)!.
        // Factorial representation of the binomial coefficient: n!/r!(n-r)!
        double a = lgamma(__n+1.0); // ln(n!)
        double b = lgamma(__r+1.0); // ln(r!)
        double c = lgamma(__n-__r+1.0); // ln((n-r))!

        o = a-c-b; // Due to precision issues, order from likelihood of largest to smallest.
        o = exp(o);
    }

    return o;
}

/**
 *  @inheritDoc
 */
float fnprf(float __n, float __r)
{
    float o = 1.0f;

    // If n and r are a positive integers, compute the standard r-permutations of n.
    if (fisintf(__n) && __n >= 0.0f && fisintf(__r) && __r >= 0.0f)
    {
        // General properties.
        if (__n == __r)      return ffactf(__n);
        if (__r == 0.0f)     return 1.0f;
        if (__r == 1.0f)     return __n;
        if (__r == __n-1.0f) return ffactf(__n);
        if (__r > __n)       return 0.0f;

        // Use approximation approach if r is too large.
        if (__r > 1E7)
        {
            int simplified = 0;

            if (simplified)
            {
                // Stirling's approximation: log(n!) ≈ nlog(n)-n
                // Factorial representation of r-permutations of n: n!/r!(n-r)!
                // Derivation:
                //      P(n,r) = n!/(n-r)!
                // log(P(n,r)) = log(n!/(n-r)!)
                // log(P(n,r)) = log(n!) - log((n-r)!)
                // log(P(n,r)) ≈ (nlog(n)-n) - ((n-r)log(n-r)-(n-r))
                // log(P(n,r)) ≈ nlog(n)-n - (n-r)log(n-r)+n-r
                // log(P(n,r)) ≈ nlog(n) - (n-r)log(n-r) - r
                //      P(n,r) ≈ 10^(nlog(n) - (n-r)log(n-r) - r)
                float a = __n * log10f(__n);
                float b = (__n-__r) * log10f(__n-__r);
                float c = __r;

                o = a-b-c; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0f)
                {
                    o = NAN;
                }
                else
                {
                    o = fpowf(10.0f, o);
                }
            }
            else
            {
                // A better approximation that incorporates Stirling's approximation: log(n!) ≈ (n+0.5)log(n)-n+0.5log(2π)
                // Factorial representation of r-permutations of n: n!/r!(n-r)!
                // Derivation:
                //      P(n,r) = n!/(n-r)!
                // log(P(n,r)) = log(n!/(n-r)!)
                // log(P(n,r)) = log(n!) - log((n-r)!)
                // log(P(n,r)) ≈ (n+0.5)log(n)-n+0.5log(2π) - (n-r+0.5)log(n-r)+(n-r)-0.5log(2π)
                // log(P(n,r)) ≈ (n+0.5)log(n) - (n-r+0.5)log(n-r) - r
                //      P(n,r) ≈ 10^((n+0.5)log(n) - (n-r+0.5)log(n-r) - r)
                float a = (__n+0.5f)*log10f(__n);
                float b = (__n-__r+0.5f)*log10f(__n-__r);
                float c = __r;

                o = a-b-c; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0f)
                {
                    o = NAN;
                }
                else
                {
                    o = fpowf(10.0f, o);
                }
            }
        }
        // Standard approach.
        else
        {
            // Factorial representation of r-permutations of n: n!/(n-r)!
            // Derivation:
            // P(n,r) = n!/(n-r)!
            //        = (1*2*...*n) / (1*2*...*(n-r))
            //        = (n-r+1) * (n-r+2) * ... * n-r+r
            //        = Π(i=1, r) n-r+i
            for (int i = 1; i <= __r; i++)
            {
                o *= __n-__r+i;
            }
        }

        return o;
    }
    // Else we are dealing with complex numbers, gamma function is needed.
    else
    {
        // Recall Γ(n) = (n-1)!, therefore Γ(n+1) = n!. Also, nCr = n!/r!(n-r)!.
        // Factorial representation of r-permutations of n: n!/(n-r)!
        float a = lgammaf(__n+1.0f); // ln(n!)
        float b = lgammaf(__n-__r+1.0f); // ln((n-r))!

        o = a-b; // Due to precision issues, order from likelihood of largest to smallest.
        o = expf(o);
    }
    
    return o;
}

/**
 *  @inheritDoc
 */
double fnpr(double __n, double __r)
{
    double o = 1.0;

    // If n and r are a positive integers, compute the standard r-permutations of n.
    if (fisint(__n) && __n >= 0.0 && fisint(__r) && __r >= 0.0)
    {
        // General properties.
        if (__n == __r)     return ffact(__n);
        if (__r == 0.0)     return 1.0;
        if (__r == 1.0)     return __n;
        if (__r == __n-1.0) return ffact(__n);
        if (__r > __n)      return 0.0;

        // Use approximation approach if r is too large.
        if (__r > 1E7)
        {
            int simplified = 0;

            if (simplified)
            {
                // Stirling's approximation: log(n!) ≈ nlog(n)-n
                // Factorial representation of r-permutations of n: n!/r!(n-r)!
                // Derivation:
                //      P(n,r) = n!/(n-r)!
                // log(P(n,r)) = log(n!/(n-r)!)
                // log(P(n,r)) = log(n!) - log((n-r)!)
                // log(P(n,r)) ≈ (nlog(n)-n) - ((n-r)log(n-r)-(n-r))
                // log(P(n,r)) ≈ nlog(n)-n - (n-r)log(n-r)+n-r
                // log(P(n,r)) ≈ nlog(n) - (n-r)log(n-r) - r
                //      P(n,r) ≈ 10^(nlog(n) - (n-r)log(n-r) - r)
                double a = __n * log10(__n);
                double b = (__n-__r) * log10(__n-__r);
                double c = __r;

                o = a-b-c; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0)
                {
                    o = NAN;
                }
                else
                {
                    o = fpow(10.0, o);
                }
            }
            else
            {
                // A better approximation that incorporates Stirling's approximation: log(n!) ≈ (n+0.5)log(n)-n+0.5log(2π)
                // Factorial representation of r-permutations of n: n!/r!(n-r)!
                // Derivation:
                //      P(n,r) = n!/(n-r)!
                // log(P(n,r)) = log(n!/(n-r)!)
                // log(P(n,r)) = log(n!) - log((n-r)!)
                // log(P(n,r)) ≈ (n+0.5)log(n)-n+0.5log(2π) - (n-r+0.5)log(n-r)+(n-r)-0.5log(2π)
                // log(P(n,r)) ≈ (n+0.5)log(n) - (n-r+0.5)log(n-r) - r
                //      P(n,r) ≈ 10^((n+0.5)log(n) - (n-r+0.5)log(n-r) - r)
                double a = (__n+0.5)*log10(__n);
                double b = (__n-__r+0.5)*log10(__n-__r);
                double c = __r;

                o = a-b-c; // Due to precision issues, order from likelihood of largest to smallest.

                if (o < 0.0)
                {
                    o = NAN;
                }
                else
                {
                    o = fpow(10.0, o);
                }
            }
        }
        // Standard approach.
        else
        {
            // Factorial representation of r-permutations of n: n!/(n-r)!
            // Derivation:
            // P(n,r) = n!/(n-r)!
            //        = (1*2*...*n) / (1*2*...*(n-r))
            //        = (n-r+1) * (n-r+2) * ... * n-r+r
            //        = Π(i=1, r) n-r+i
            for (int i = 1; i <= __r; i++)
            {
                o *= __n-__r+i;
            }
        }

        return o;
    }
    // Else we are dealing with complex numbers, gamma function is needed.
    else
    {
        // Recall Γ(n) = (n-1)!, therefore Γ(n+1) = n!. Also, nCr = n!/r!(n-r)!.
        // Factorial representation of r-permutations of n: n!/(n-r)!
        double a = lgamma(__n+1.0); // ln(n!)
        double b = lgamma(__n-__r+1.0); // ln((n-r))!

        o = a-b; // Due to precision issues, order from likelihood of largest to smallest.
        o = exp(o);
    }
    
    return o;
}

/**
 *  @inheritDoc
 */
float fpowf(float __x, float __n)
{
    if ((__x < 0.0f) && (__n > 0.0f) && (__n < 1.0f))
    {
        float inv = fabsf(1.0f/__n);

        if (((inv - roundf(inv)) < FLT_EPSILON) && isodd(roundf(inv)))
        {
            return frootf(__x, roundf(inv));
        }
    }

    return powf(__x, __n);
}

/**
 *  @inheritDoc
 */
double fpow(double __x, double __n)
{
    if ((__x < 0.0) && (__n > 0.0) && (__n < 1.0))
    {
        double inv = fabs(1.0/__n);

        if (((inv - round(inv)) < FLT_EPSILON) && isodd(round(inv)))
        {
            return froot(__x, round(inv));
        }
    }

    return pow(__x, __n);
}

/**
 *  @inheritDoc
 */
float frootf(float __x, float __n)
{
    if ((__x < 0.0f) && fisintf(__n) && isodd(__n))
    {
        return -powf(fabsf(__x), 1.0f/__n);
    }
    else
    {
        return powf(__x, 1.0f/__n);
    }
}

/**
 *  @inheritDoc
 */
double froot(float __x, float __n)
{
    if ((__x < 0.0) && fisint(__n) && isodd(__n))
    {
        return -pow(fabs(__x), 1.0/__n);
    }
    else
    {
        return pow(__x, 1.0/__n);
    }
}

#pragma mark - Bitwise Operations
#pragma mark Bit Shifting

/**
 *  @inheritDoc
 */
unsigned char clshift(unsigned char __n)
{
    return (__n << 1);
}

/**
 *  @inheritDoc
 */
unsigned short hulshift(unsigned short __n)
{
    return (__n << 1);
}

/**
 *  @inheritDoc
 */
unsigned int ulshift(unsigned int __n)
{
    return (__n << 1);
}

/**
 *  @inheritDoc
 */
unsigned long lulshift(unsigned long __n)
{
    return (__n << 1);
}

/**
 *  @inheritDoc
 */
unsigned long long llulshift(unsigned long long __n)
{
    return (__n << 1);
}

/**
 *  @inheritDoc
 */
unsigned char crshift(unsigned char __n)
{
    return (__n >> 1);
}

/**
 *  @inheritDoc
 */
unsigned short hurshift(unsigned short __n)
{
    return (__n >> 1);
}

/**
 *  @inheritDoc
 */
unsigned int urshift(unsigned int __n)
{
    return (__n >> 1);
}

/**
 *  @inheritDoc
 */
unsigned long lurshift(unsigned long __n)
{
    return (__n >> 1);
}

/**
 *  @inheritDoc
 */
unsigned long long llurshift(unsigned long long __n)
{
    return (__n >> 1);
}

/**
 *  @inheritDoc
 */
unsigned char clrotate(unsigned char __n)
{
    return ((__n << 1) | (__n >> (sizeof(unsigned char)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned short hulrotate(unsigned short __n)
{
    return ((__n << 1) | (__n >> (sizeof(unsigned short)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned int ulrotate(unsigned int __n)
{
    return ((__n << 1) | (__n >> (sizeof(unsigned int)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned long lulrotate(unsigned long __n)
{
    return ((__n << 1) | (__n >> (sizeof(unsigned long)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned long long llulrotate(unsigned long long __n)
{
    return ((__n << 1) | (__n >> (sizeof(unsigned long long)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned char crrotate(unsigned char __n)
{
    return ((__n >> 1) | (__n << (sizeof(unsigned char)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned short hurrotate(unsigned short __n)
{
    return ((__n >> 1) | (__n << (sizeof(unsigned short)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned int urrotate(unsigned int __n)
{
    return ((__n >> 1) | (__n << (sizeof(unsigned int)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned long lurrotate(unsigned long __n)
{
    return ((__n >> 1) | (__n << (sizeof(unsigned long)*8-1)));
}

/**
 *  @inheritDoc
 */
unsigned long long llurrotate(unsigned long long __n)
{
    return ((__n >> 1) | (__n << (sizeof(unsigned long long)*8-1)));
}

#pragma mark Inverse

/**
 *  @inheritDoc
 */
unsigned char ccomp1(unsigned char __n)
{
    return (~__n);
}

/**
 *  @inheritDoc
 */
unsigned short hucomp1(unsigned short __n)
{
    return (~__n);
}

/**
 *  @inheritDoc
 */
unsigned int ucomp1(unsigned int __n)
{
    return (~__n);
}

/**
 *  @inheritDoc
 */
unsigned long lucomp1(unsigned long __n)
{
    return (~__n);
}

/**
 *  @inheritDoc
 */
unsigned long long llucomp1(unsigned long long __n)
{
    return (~__n);
}

/**
 *  @inheritDoc
 */
unsigned char ccomp2(unsigned char __n)
{
    return (~__n + 1);
}

/**
 *  @inheritDoc
 */
unsigned short hucomp2(unsigned short __n)
{
    return (~__n + 1);
}

/**
 *  @inheritDoc
 */
unsigned int ucomp2(unsigned int __n)
{
    return (~__n + 1);
}

/**
 *  @inheritDoc
 */
unsigned long lucomp2(unsigned long __n)
{
    return (~__n + 1);
}

/**
 *  @inheritDoc
 */
unsigned long long llucomp2(unsigned long long __n)
{
    return (~__n + 1);
}

/**
 *  @inheritDoc
 */
unsigned char cflipb(unsigned char __n)
{
    unsigned char o = __n;

    if ((__n >> 0) & 0xFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned short huflipb(unsigned short __n)
{
    unsigned short o = __n;

    if ((__n >> 8) & 0xFF)
    {
        o = (__n & 0xFF) << 8 | (__n >> 8 & 0xFF);
    }
    else if ((__n >> 0) & 0xFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned int uflipb(unsigned int __n)
{
    unsigned int o = __n;

    if ((__n >> 24) & 0xFF)
    {
        o = (__n & 0xFF) << 24 | (__n >> 8 & 0xFF) << 16 | (__n >> 16 & 0xFF) << 8 | (__n >> 24 & 0xFF);
    }
    else if ((__n >> 16) & 0xFF)
    {
        o = (__n & 0xFF) << 16 | (__n >> 8 & 0xFF) << 8 | (__n >> 16 & 0xFF);
    }
    else if ((__n >> 8) & 0xFF)
    {
        o = (__n & 0xFF) << 8 | (__n >> 8 & 0xFF);
    }
    else if ((__n >> 0) & 0xFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned long luflipb(unsigned long __n)
{
    unsigned long o = __n;

    if ((__n >> 24) & 0xFF)
    {
        o = (__n & 0xFF) << 24 | (__n >> 8 & 0xFF) << 16 | (__n >> 16 & 0xFF) << 8 | (__n >> 24 & 0xFF);
    }
    else if ((__n >> 16) & 0xFF)
    {
        o = (__n & 0xFF) << 16 | (__n >> 8 & 0xFF) << 8 | (__n >> 16 & 0xFF);
    }
    else if ((__n >> 8) & 0xFF)
    {
        o = (__n & 0xFF) << 8 | (__n >> 8 & 0xFF);
    }
    else if ((__n >> 0) & 0xFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned long long lluflipb(unsigned long long __n)
{
    unsigned long long o = __n;

    if ((__n >> 56) & 0xFF)
    {
        o = (__n & 0xFF) << 56 | (__n >> 8 & 0xFF) << 48 | (__n >> 16 & 0xFF) << 40 | (__n >> 24 & 0xFF) << 32 | (__n >> 32 & 0xFF) << 24 | (__n >> 40 & 0xFF) << 16 | (__n >> 48 & 0xFF) << 8 | (__n >> 56 & 0xFF);
    }
    else if ((__n >> 48) & 0xFF)
    {
        o = (__n & 0xFF) << 48 | (__n >> 8 & 0xFF) << 40 | (__n >> 16 & 0xFF) << 32 | (__n >> 24 & 0xFF) << 24 | (__n >> 32 & 0xFF) << 16 | (__n >> 40 & 0xFF) << 8 | (__n >> 48 & 0xFF);
    }
    else if ((__n >> 40) & 0xFF)
    {
        o = (__n & 0xFF) << 40 | (__n >> 8 & 0xFF) << 32 | (__n >> 16 & 0xFF) << 24 | (__n >> 24 & 0xFF) << 16 | (__n >> 32 & 0xFF) << 8 | (__n >> 40 & 0xFF);
    }
    else if ((__n >> 32) & 0xFF)
    {
        o = (__n & 0xFF) << 32 | (__n >> 8 & 0xFF) << 24 | (__n >> 16 & 0xFF) << 16 | (__n >> 24 & 0xFF) << 8 | (__n >> 32 & 0xFF);
    }
    else if ((__n >> 24) & 0xFF)
    {
        o = (__n & 0xFF) << 24 | (__n >> 8 & 0xFF) << 16 | (__n >> 16 & 0xFF) << 8 | (__n >> 24 & 0xFF);
    }
    else if ((__n >> 16) & 0xFF)
    {
        o = (__n & 0xFF) << 16 | (__n >> 8 & 0xFF) << 8 | (__n >> 16 & 0xFF);
    }
    else if ((__n >> 8) & 0xFF)
    {
        o = (__n & 0xFF) << 8 | (__n >> 8 & 0xFF);
    }
    else if ((__n >> 0) & 0xFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned char cflipw(unsigned char __n)
{
    return __n;
}

/**
 *  @inheritDoc
 */
unsigned short huflipw(unsigned short __n)
{
    unsigned short o = __n;

    if (__n & 0xFFFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned int uflipw(unsigned int __n)
{
    unsigned int o = __n;

    if ((__n >> 16) & 0xFFFF)
    {
        o = (__n & 0xFFFF) << 16 | (__n >> 16 & 0xFFFF);
    }
    else if (__n & 0xFFFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned long luflipw(unsigned long __n)
{
    unsigned long o = __n;

    if ((__n >> 16) & 0xFFFF)
    {
        o = (__n & 0xFFFF) << 16 | (__n >> 16 & 0xFFFF);
    }
    else if (__n & 0xFFFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  @inheritDoc
 */
unsigned long long lluflipw(unsigned long long __n)
{
    unsigned long long o = __n;

    if ((__n >> 48) & 0xFFFF)
    {
        o = (__n & 0xFFFF) << 48 | (__n >> 16 & 0xFFFF) << 32 | (__n >> 32 & 0xFFFF) << 16 | (__n >> 48 & 0xFFFF);
    }
    else if ((__n >> 32) & 0xFFFF)
    {
        o = (__n & 0xFFFF) << 32 | (__n >> 16 & 0xFFFF) << 16 | (__n >> 32 & 0xFFFF);
    }
    else if ((__n >> 16) & 0xFFFF)
    {
        o = (__n & 0xFFFF) << 16 | (__n >> 16 & 0xFFFF);
    }
    else if (__n & 0xFFFF)
    {
        o = __n;
    }

    return o;
}

#pragma mark - Number Moderations

/**
 *  @inheritDoc
 */
float fboundf(float __n, float __min, float __max)
{
    float o = __n;

    if (!isnan(__max) && (__n > __max)) o = __max;
    if (!isnan(__min) && (__n < __min)) o = __min;

    return o;
}

/**
 *  @inheritDoc
 */
double fbound(double __n, double __min, double __max)
{
    double o = __n;

    if (!isnan(__max) && (__n > __max)) o = __max;
    if (!isnan(__min) && (__n < __min)) o = __min;

    return o;
}

/**
 *  @inheritDoc
 */
int fisboundedf(float __n, float __min, float __max)
{
    if (__max < __min) return 0;
    if (isnan(__n)) return 0;
    if (isnan(__max) && isnan(__min)) return 0;

    if (!isnan(__max) && !isnan(__min) && (__n <= __max) && (__n >= __min))
    {
        return 1;
    }
    else if (isnan(__max))
    {
        if (__n >= __min)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    else if (isnan(__min))
    {
        if (__n <= __max)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return 0;
    }
}

/**
 *  @inheritDoc
 */
int fisbounded(double __n, double __min, double __max)
{
    if (__max < __min) return 0;
    if (isnan(__n)) return 0;
    if (isnan(__max) && isnan(__min)) return 0;

    if (!isnan(__max) && !isnan(__min) && (__n <= __max) && (__n >= __min))
    {
        return 1;
    }
    else if (isnan(__max))
    {
        if (__n >= __min)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    else if (isnan(__min))
    {
        if (__n <= __max)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return 0;
    }
}

/**
 *  @inheritDoc
 */
int fisintf(float __n)
{
    if (__n == 0.0f)
    {
        return 1;
    }
    else if (fmodf(__n, floorf(__n)) == 0.0f)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

/**
 *  @inheritDoc
 */
int fisint(double __n)
{
    if (__n == 0.0)
    {
        return 1;
    }
    else if (fmod(__n, floor(__n)) == 0.0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

/**
 *  @inheritDoc
 */
int iseven(int __n)
{
    if (__n == 0)
    {
        return 1;
    }
    else
    {
        if (__n % 2 == 0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
}

/**
 *  @inheritDoc
 */
int isodd(int __n)
{
    return !iseven(__n);
}

/**
 *  @inheritDoc
 */
float fnormf(float __n)
{
    return ((fabsf(roundf(__n) - __n) < FLT_EPSILON) ? roundf(__n) : __n);
}

/**
 *  @inheritDoc
 */
double fnorm(double __n)
{
    return ((fabs(round(__n) - __n) < DBL_EPSILON) ? round(__n) : __n);
}

/**
 *  @inheritDoc
 */
int ndigits(int __n)
{
    if (__n < 0)
    {
        return ndigits(-__n);
    }

    if (__n >= 10000)
    {
        if (__n >= 10000000)
        {
            if (__n >= 100000000)
            {
                if (__n >= 1000000000)
                {
                    return 10;
                }

                return 9;
            }

            return 8;
        }

        if (__n >= 100000)
        {
            if (__n >= 1000000)
            {
                return 7;
            }

            return 6;
        }

        return 5;
    }

    if (__n >= 100)
    {
        if (__n >= 1000)
        {
            return 4;
        }

        return 3;
    }
    
    if (__n >= 10)
    {
        return 2;
    }
    
    return 1;
}

#pragma mark - String Moderations
#pragma mark Verifications

/**
 *  @inheritDoc
 */
int fstrisnumf(const char *__c)
{
    char *t;

    strtof_l(__c, &t, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  @inheritDoc
 */
int fstrisnum(const char *__c)
{
    char *t;

    strtod_l(__c, &t, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  @inheritDoc
 */
int fstrisnuml(const char *__c)
{
    char *t;

    strtold_l(__c, &t, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  @inheritDoc
 */
int lstrisnum(const char *__c)
{
    char *t;

    strtol_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  @inheritDoc
 */
int llstrisnum(const char *__c)
{
    char *t;

    strtoll_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  @inheritDoc
 */
int lustrisnum(const char *__c)
{
    char *t;

    strtoul_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  @inheritDoc
 */
int llustrisnum(const char *__c)
{
    char *t;

    strtoull_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

#pragma mark Conversions

/**
 *  @inheritDoc
 */
float fstrtonumf(const char *__c)
{
    char *t;
    float f = strtof_l(__c, &t, LC_GLOBAL_LOCALE);

    if (*t == 0)
    {
        return f;
    }
    else
    {
        return NAN;
    }
}

/**
 *  @inheritDoc
 */
double fstrtonum(const char *__c)
{
    char *t;
    double d = strtod_l(__c, &t, LC_GLOBAL_LOCALE);

    if (*t == 0)
    {
        return d;
    }
    else
    {
        return NAN;
    }
}

/**
 *  @inheritDoc
 */
long double fstrtonuml(const char *__c)
{
    char *t;
    long double ld = strtold_l(__c, &t, LC_GLOBAL_LOCALE);

    if (*t == 0)
    {
        return ld;
    }
    else
    {
        return NAN;
    }
}

/**
 *  @inheritDoc
 */
long int lstrtonum(const char *__c)
{
    char *t;
    long int l = strtol_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    if (*t == 0)
    {
        return l;
    }
    else
    {
        return 0;
    }
}

/**
 *  @inheritDoc
 */
long long int llstrtonum(const char *__c)
{
    char *t;
    long long int ll = strtoll_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    if (*t == 0)
    {
        return ll;
    }
    else
    {
        return 0;
    }
}

/**
 *  @inheritDoc
 */
unsigned long int lustrtonum(const char *__c)
{
    char *t;
    unsigned long int ul = strtoul_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    if (*t == 0)
    {
        return ul;
    }
    else
    {
        return 0;
    }
}

/**
 *  @inheritDoc
 */
unsigned long long int llustrtonum(const char *__c)
{
    char *t;
    unsigned long long int ull = strtoull_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    if (*t == 0)
    {
        return ull;
    }
    else
    {
        return 0;
    }
}

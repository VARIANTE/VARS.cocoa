/**
 *  VARSobjc
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

/**
 *  Converts a float value in degrees to a float value in radians.
 *
 *  @param __n
 *
 *  @return The converted float value in radians.
 */
float fdtorf(float __n)
{
    float o = __n * (M_PI/180.0f);

    return o;
}

/**
 *  Converts a double value in degrees to a double value in radians.
 *
 *  @param __n
 *
 *  @return The converted double value in radians.
 */
double fdtor(double __n)
{
    double o = __n * (M_PI/180.0);

    return o;
}

/**
 *  Converts a float value in degrees to a float value in gradians.
 *
 *  @param __n
 *
 *  @return The converted float value in gradians.
 */
float fdtogf(float __n)
{
    float o = __n * (10.0f/9.0f);

    return o;
}

/**
 *  Converts a double value in degrees to a double value in gradians.
 *
 *  @param __n
 *
 *  @return The converted double value in gradians.
 */
double fdtog(double __n)
{
    double o = __n * (10.0/9.0);

    return o;
}

/**
 *  Converts a float value in radians to a float value in degrees.
 *
 *  @param __n
 *
 *  @return The converted float value in degrees.
 */
float frtodf(float __n)
{
    float o = __n * (180.0f/M_PI);

    return o;
}

/**
 *  Converts a double value in radians to a double value in degrees.
 *
 *  @param __n
 *
 *  @return The converted double value in degrees.
 */
double frtod(double __n)
{
    double o = __n * (180.0/M_PI);

    return o;
}

/**
 *  Converts a float value in radians to a float value in gradians.
 *
 *  @param __n
 *
 *  @return The converted float value in gradians.
 */
float frtogf(float __n)
{
    float o = __n * (200.0f/M_PI);

    return o;
}

/**
 *  Converts a double value in radians to a double value in gradians.
 *
 *  @param __n
 *
 *  @return The converted double value in gradians.
 */
double frtog(double __n)
{
    double o = __n * (200.0/M_PI);

    return o;
}

/**
 *  Converts a float value in gradians to a float value in degrees.
 *
 *  @param __n
 *
 *  @return The converted float value in degrees.
 */
float fgtodf(float __n)
{
    float o = __n * (9.0f/10.0f);

    return o;
}

/**
 *  Converts a double value in gradians to a double value in degrees.
 *
 *  @param __n
 *
 *  @return The converted double value in degrees.
 */
double fgtod(double __n)
{
    double o = __n * (9.0/10.0);

    return o;
}

/**
 *  Converts a float value in gradians to a float value in radians.
 *
 *  @param __n
 *
 *  @return The converted float value in radians.
 */
float fgtorf(float __n)
{
    float o = __n * (M_PI/200.0f);

    return o;
}

/**
 *  Converts a double value in gradians to a double value in radians.
 *
 *  @param __n
 *
 *  @return The converted double value in radians.
 */
double fgtor(double __n)
{
    double o = __n * (M_PI/200.0);

    return o;
}

/**
 *  Computes the factorial of a float value. Supports the factorial computation
 *  of positive/negative non-integers.
 *
 *  @param __n
 *
 *  @return The computed float value if applicable, NAN otherwise (i.e. computing the factorial of
 *          a negative integer).
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
 *  Computes the factorial of a double value. Supports the factorial computation
 *  of positive/negative non-integers.
 *
 *  @param __n
 *
 *  @return The computed double value if applicable, NAN otherwise (i.e. computing the factorial of
 *          a negative integer).
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
 *  Computes n choose r. If both n and r are positive integers, the output
 *  would be the binomial coefficient, involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed float value.
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

        // Use approximation approach if r is too large.
        if (__r > 1E7)
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
 *  Computes n choose r. If both n and r are positive integers, the output
 *  would be the binomial coefficient, involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed double value.
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

        // Use approximation approach if r is too large.
        if (__r > 1E7)
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
                    o = pow(10.0, o);
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
                    o = pow(10.0, o);
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
 *  Computes n pick r. If both n and r are positive integers, the output
 *  would be the standard r-permutations of n involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed float value.
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
                    o = pow(10.0f, o);
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
                    o = powf(10.0f, o);
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
 *  Computes n pick r. If both n and r are positive integers, the output
 *  would be the standard r-permutations of n involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed double value.
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
                    o = pow(10.0, o);
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
                    o = pow(10.0, o);
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
 *  Computes the sine of a float value in degrees.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fsindf(float __n)
{
    float o = fsinrf(fdtorf(__n));

    return o;
}

/**
 *  Computes the sine of a double value in degrees.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fsind(double __n)
{
    double o = fsinr(fdtor(__n));

    return o;
}

/**
 *  Computes the cosine of a float value in degrees.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fcosdf(float __n)
{
    float o = fcosrf(fdtorf(__n));

    return o;
}

/**
 *  Computes the cosine of a double value in degrees.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fcosd(double __n)
{
    double o = fcosr(fdtor(__n));

    return o;
}

/**
 *  Computes the tangent of a float value in degrees.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float ftandf(float __n)
{
    float o = ftanrf(fdtorf(__n));

    return o;
}

/**
 *  Computes the tangent of a double value in degrees.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double ftand(double __n)
{
    double o = ftanr(fdtor(__n));

    return o;
}

/**
 *  Computes the sine of a float value in radians.
 *
 *  @param __n
 *
 *  @return The computed float value.
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
 *  Computes the sine of a double value in radians.
 *
 *  @param __n
 *
 *  @return The computed double value.
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
 *  Computes the cosine of a float value in radians.
 *
 *  @param __n
 *
 *  @return The computed float value.
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
 *  Computes the cosine of a double value in radians.
 *
 *  @param __n
 *
 *  @return The computed double value.
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
 *  Computes the tangent of a float value in radians.
 *
 *  @param __n
 *
 *  @return The computed float value.
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
 *  Computes the tangent of a double value in radians.
 *
 *  @param __n
 *
 *  @return The computed double value.
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
 *  Computes the sine of a float value in gradians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fsingf(float __n)
{
    float o = fsinrf(fgtorf(__n));

    return o;
}

/**
 *  Computes the sine of a double value in gradians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fsing(double __n)
{
    double o = fsinr(fgtor(__n));

    return o;
}

/**
 *  Computes the cosine of a float value in gradians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fcosgf(float __n)
{
    float o = fcosrf(fgtorf(__n));

    return o;
}

/**
 *  Computes the cosine of a double value in gradians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fcosg(double __n)
{
    double o = fcosr(fgtor(__n));

    return o;
}

/**
 *  Computes the tangent of a float value in gradians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float ftangf(float __n)
{
    float o = ftanrf(fgtorf(__n));

    return o;
}

/**
 *  Computes the tangent of a double value in gradians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double ftang(double __n)
{
    double o = ftanr(fgtor(__n));

    return o;
}

/**
 *  Validates that the specified float value is within the
 *  specified bounds, returns the moderated specified value.
 *
 *  @param __n
 *
 *  @return The moderated float value.
 */
float fboundf(float __n, float __min, float __max)
{
    float o = __n;

    if (!isnan(__max) && (__n > __max)) o = __max;
    if (!isnan(__min) && (__n < __min)) o = __min;

    return o;
}

/**
 *  Validates that the specified double value is within the
 *  specified bounds, returns the moderated specified value.
 *
 *  @param __n
 *
 *  @return The moderated double value.
 */
double fbound(double __n, double __min, double __max)
{
    double o = __n;

    if (!isnan(__max) && (__n > __max)) o = __max;
    if (!isnan(__min) && (__n < __min)) o = __min;

    return o;
}

/**
 *  Evaluates the slope between two points.
 *
 *  @param __x1
 *  @param __x2
 *  @param __y1
 *  @param __y2
 *
 *  @return The float value of the slope.
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
 *  Evaluates the slope between two points.
 *
 *  @param __x1
 *  @param __x2
 *  @param __y1
 *  @param __y2
 *
 *  @return The double value of the slope.
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

/**
 *  Normalizes a float value, checking against epsilon.
 *
 *  @param __n
 *
 *  @return The normalized float value.
 */
float fnormf(float __n)
{
    return ((fabsf(roundf(__n) - __n) < FLT_EPSILON) ? roundf(__n) : __n);
}

/**
 *  Normalizes a double value, checking against epsilon.
 *
 *  @param __n
 *
 *  @return The normalized double value.
 */
double fnorm(double __n)
{
    return ((fabs(round(__n) - __n) < DBL_EPSILON) ? round(__n) : __n);
}

/**
 *  Left shifts an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long lshift(unsigned long long __n)
{
    return (__n << 1);
}

/**
 *  Right shifts an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long rshift(unsigned long long __n)
{
    return (__n >> 1);
}

/**
 *  Left rotates an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long lrotate(unsigned long long __n)
{
    return ((__n << 1) | (__n >> (sizeof(unsigned long long)*8-1)));
}

/**
 *  Right rotates an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long rrotate(unsigned long long __n)
{
    return ((__n >> 1) | (__n << (sizeof(unsigned long long)*8-1)));
}

/**
 *  Computes the 1's complement of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long comp1(unsigned long long __n)
{
    return (~__n);
}

/**
 *  Computes the 2's complement of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long comp2(unsigned long long __n)
{
    return (~__n + 1);
}

/**
 *  Flips the bytes of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long flipb(unsigned long long __n)
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
    else if (__n & 0xFF)
    {
        o = __n;
    }

    return o;
}

/**
 *  Flips the words of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long flipw(unsigned long long __n)
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

/**
 *  Computes the number of digits in an int.
 *
 *  @param __n
 *
 *  @return The number of digits.
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

/**
 *  Verifies that a float value is within the specified bounds.
 *
 *  @param __n
 *  @param __min
 *  @param __max
 *
 *  @return 1 if bounded, 0 otherwise.
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
 *  Verifies that a double value is within the specified bounds.
 *
 *  @param __n
 *  @param __min
 *  @param __max
 *
 *  @return 1 if bounded, 0 otherwise.
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
 *  Verifies that a float value is an integer.
 *
 *  @param __n
 *
 *  @return 1 if specified float value is an integer, 0 otherwise.
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
 *  Verifies that a double value is an integer.
 *
 *  @param __n
 *
 *  @return 1 if specified double value is an integer, 0 otherwise.
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
 *  Verifies that an int value is even. 0 is considered even.
 *
 *  @param __n
 *
 *  @return 1 if even, 0 otherwise.
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
 *  Verifies that an int value is odd.
 *
 *  @param __n
 *
 *  @return 1 if odd, 0 otherwise.
 */
int isodd(int __n)
{
    return !iseven(__n);
}

/**
 *  Verifies that a string represents a float value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int fstrisnumf(const char *__c)
{
    char *t;

    strtof_l(__c, &t, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  Verifies that a string represents a double value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int fstrisnum(const char *__c)
{
    char *t;

    strtod_l(__c, &t, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  Verifies that a string represents a long double value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int fstrisnuml(const char *__c)
{
    char *t;

    strtold_l(__c, &t, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  Verifies that a string represents a long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int lstrisnum(const char *__c)
{
    char *t;

    strtol_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  Verifies that a string represents a long long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int llstrisnum(const char *__c)
{
    char *t;

    strtoll_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  Verifies that a string represents a unsigned long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int lustrisnum(const char *__c)
{
    char *t;

    strtoul_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  Verifies that a string represents a unsigned long long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int llustrisnum(const char *__c)
{
    char *t;

    strtoull_l(__c, &t, 0, LC_GLOBAL_LOCALE);

    return (*t == 0);
}

/**
 *  Converts a string to a float value if applicable.
 *
 *  @param __c
 *
 *  @return Float value of the string if applicable, NAN otherwise.
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
 *  Converts a string to a double value if applicable. Precision accurate to 16 decimals.
 *
 *  @param __c
 *
 *  @return Double value of the string if applicable, NAN otherwise.
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
 *  Converts a string to a long double value if applicable. 
 *
 *  @param __c
 *
 *  @return Long double value of the string if applicable, NAN otherwise.
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
 *  Converts a string to a long int value if applicable.
 *
 *  @param __c
 *
 *  @return Long int value of the string if applicable, 0 otherwise.
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
 *  Converts a string to a long long int value if applicable.
 *
 *  @param __c
 *
 *  @return Long long int value of the string if applicable, 0 otherwise.
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
 *  Converts a string to an unsigned long int value if applicable.
 *
 *  @param __c
 *
 *  @return Unsigned long int value of the string if applicable, 0 otherwise.
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
 *  Converts a string to an unsigned long long int value if applicable.
 *
 *  @param __c
 *
 *  @return Unsigned long long int value of the string if applicable, 0 otherwise.
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

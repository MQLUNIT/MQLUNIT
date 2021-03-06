/// @file   Number.mqh
/// @author Copyright 2017, Eneset Group Trust
/// @brief  Functions and definitions for working with numbers.

//-----------------------------------------------------------------------------
// Copyright 2017, Eneset Group Trust
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//-----------------------------------------------------------------------------

#property strict

#ifndef MQLLIB_LANG_NUMBER_MQH
#define MQLLIB_LANG_NUMBER_MQH

#include "Cast.mqh"

//-----------------------------------------------------------------------------

/// @brief Number of bits in @a char type
#define CHAR_BITS   8

/// @brief Number of bits in @a short type
#define SHORT_BITS  16

/// @brief Number of bits in @a int type
#define INT_BITS    32

/// @brief Number of bits in @a long type
#define LONG_BITS   64

/// @brief Number of bits in @a double type
#define DBL_BITS    64

/// @brief Number of bits in @a float type
#define FLT_BITS    32

/// @brief Float value functions.
struct MQLLIB_Lang_Single {
    float              Value;
    static const float NaN;
    static const float NegativeInfinity;
    static const float PositiveInfinity;

    /// @brief Returns a value that indicates whether the specified value is
    /// not a number (NaN).
    /// @return true, if value is NaN
    static bool isNaN(const float value) {
        return value == 0xFFFF000000000000;
    }

    /// @brief Returns a value indicating whether the specified number
    /// evaluates to positive infinity.
    /// @return true, if a number evaluates to positive infinity
    static bool isPositiveInfinity(const float value) {
        return value == 0x7FF0000000000000;
    }

    /// @brief Returns a value indicating whether the specified number
    /// evaluates to negative infinity.
    /// @return true, if a number evaluates to negative infinity
    static bool isNegativeInfinity(const float value) {
        return value == 0xFFF0000000000000;
    }

    /// @brief Returns a value indicating whether the specified number
    /// evaluates to negative or positive infinity.
    /// @return true, if a number evaluates to negative or positive infinity
    static bool isInfinity(const float value) {
        return (MQLLIB_Lang_Single::isNegativeInfinity(value)
            || MQLLIB_Lang_Single::isPositiveInfinity(value));
    }
};

//-----------------------------------------------------------------------------

const float MQLLIB_Lang_Single::NegativeInfinity = (float) -MathExp(DBL_MAX);
const float MQLLIB_Lang_Single::PositiveInfinity = (float)  MathExp(DBL_MAX);
const float MQLLIB_Lang_Single::NaN =
    (float) MQLLIB_Lang_Single::PositiveInfinity
        / MQLLIB_Lang_Single::NegativeInfinity;

//-----------------------------------------------------------------------------

/// @brief Double value functions. struct Double
struct MQLLIB_Lang_Double {
    double              Value;
    static const double NaN;
    static const double NegativeInfinity;
    static const double PositiveInfinity;

    /// @brief Returns a value that indicates whether the specified value is
    /// not a number (NaN).
    /// @return true, if value is NaN
    static bool isNaN(const double value) {
        return (!MathIsValidNumber(value) && !isInfinity(value));
    }

    /// @brief Returns a value indicating whether the specified number
    /// evaluates to positive infinity.
    /// @return true, if a number evaluates to positive infinity
    static bool isPositiveInfinity(const double value) {
        const long n = 0x7FF0000000000000;
        double d;
        reinterpret_cast(n, d);
        return value == d;
    }

    /// @brief Returns a value indicating whether the specified number
    /// evaluates to negative infinity.
    /// @return true, if a number evaluates to negative infinity
    static bool isNegativeInfinity(const double value) {
        const long n = 0xFFF0000000000000;
        double d;
        reinterpret_cast(n, d);
        return value == d;
    }

    /// @brief Returns a value indicating whether the specified number
    /// evaluates to negative or positive infinity.
    /// @return true, if a number evaluates to negative or positive infinity
    static bool isInfinity(const double value)  {
      return (MQLLIB_Lang_Double::isNegativeInfinity(value)
        || MQLLIB_Lang_Double::isPositiveInfinity(value));
     }
  };

const double MQLLIB_Lang_Double::NegativeInfinity = -MathExp(DBL_MAX);
const double MQLLIB_Lang_Double::PositiveInfinity =  MathExp(DBL_MAX);
const double MQLLIB_Lang_Double::NaN =
    MQLLIB_Lang_Double::PositiveInfinity
        / MQLLIB_Lang_Double::NegativeInfinity;

//-----------------------------------------------------------------------------

#endif

/* Copyright (C) 2013-2016 by Jacob Alexander
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#pragma once

// ----- Includes -----



// ----- Defines -----

// You can change these to give your code its own name.
#define STR_MANUFACTURER        L"Kiibohd"
#define STR_PRODUCT             L"Keyboard - MD1.1 PartialMap pjrcUSB full"
#define STR_SERIAL              L"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX - mk20dx128vlf5"


// Strings used in the CLI module
#define CLI_Revision            "ba3c38bf844d0bea1681387ac8602e4ac1ba5f4c"
#define CLI_Branch              "master"
#define CLI_ModifiedStatus      "Clean"
#define CLI_ModifiedFiles       "\r\n\t"
#define CLI_RepoOrigin          "https://github.com/kiibohd/controller.git"
#define CLI_CommitDate          "2016-10-10 23:15:13 -0700"
#define CLI_CommitAuthor        "GitHub <noreply@github.com>"
#define CLI_Modules             "Scan(MD1.1) Macro(PartialMap) Output(pjrcUSB) Debug(full)"
#define CLI_BuildDate           "2017-01-16 21:41:37 +0000"
#define CLI_BuildOS             "Linux-4.1.5-x86_64-linode61"
#define CLI_Arch                "arm"
#define CLI_Chip                "mk20dx128vlf5"
#define CLI_CPU                 "cortex-m4"
#define CLI_Device              "Keyboard"


// Mac OS-X and Linux automatically load the correct drivers.  On
// Windows, even though the driver is supplied by Microsoft, an
// INF file is needed to load the driver.  These numbers need to
// match the INF file.
#define VENDOR_ID               0x1C11
#define PRODUCT_ID              0xB04D
#define BCD_VERSION             479


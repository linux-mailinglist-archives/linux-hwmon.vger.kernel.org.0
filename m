Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29592A7652
	for <lists+linux-hwmon@lfdr.de>; Thu,  5 Nov 2020 05:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730120AbgKEEXN (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 4 Nov 2020 23:23:13 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:45252 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgKEEXN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Nov 2020 23:23:13 -0500
Received: from srv.home ([10.8.0.1] ident=heh21094)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <brad@fnarfbargle.com>)
        id 1kaWnL-0008Py-GX; Thu, 05 Nov 2020 12:22:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject; bh=d3nkXPT18ncMIFMJPBoJZTPur28wbiK2b0xm2LGAcWE=;
        b=U61Azf7LaUNM5LpGyB+586lT4cVtRMbOYzNm5toyulzKZSr2OHRPYKuzoeA9zVDoP+nLHNemJFGs27/2y6PJakAYIWc/TQGNQDlcaHJwb2yBymETqIWz7qzibbj/EWyPLW+0qbCQjcmt1TuVgMRFZ9UMoNINbAdWfsLXcKU/zcs=;
Subject: Re: [REGRESSION] hwmon: (applesmc) avoid overlong udelay()
From:   Brad Campbell <brad@fnarfbargle.com>
To:     Andreas Kemnade <andreas@kemnade.info>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, rydberg@bitmath.org,
        linux-hwmon@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        hns@goldelico.com
References: <20200930105442.3f642f6c@aktux>
 <20200930164446.GB219887@roeck-us.net>
 <CAK8P3a2CbhJT+B-F+cnX+uiJep9oiLM28n045-ATaVaU41u2hw@mail.gmail.com>
 <20201002002251.28462e64@aktux>
 <7543ef85-727d-96c3-947e-5b18e9e6c44d@roeck-us.net>
 <20201006090226.4275c824@kemnade.info>
 <db042e9b-be41-11b1-7059-3881b1da5c8b@fnarfbargle.com>
 <68467f1b-cea1-47ea-a4d4-8319214b072a@fnarfbargle.com>
 <20201104142057.62493c12@aktux>
 <2436afef-99c6-c352-936d-567bf553388c@fnarfbargle.com>
Message-ID: <e6b27029-81a7-f83f-f645-34c9d7c59215@fnarfbargle.com>
Date:   Thu, 5 Nov 2020 15:22:40 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <2436afef-99c6-c352-936d-567bf553388c@fnarfbargle.com>
Content-Type: multipart/mixed;
 boundary="------------A6A834BC37CB7077A33E8972"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is a multi-part message in MIME format.
--------------A6A834BC37CB7077A33E8972
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/11/20 1:18 pm, Brad Campbell wrote:
> I'm not entirely sure where to go from here. I'd really like some wider testing before cleaning this up and submitting it. It puts extra checks & constraints on the comms with the SMC that weren't there previously.
> 
> I guess given there doesn't appear to have been a major outcry that the driver broke in 5.9 might indicate that nobody is using it, or that it only broke on certain machines?
> 
> Can we get some guidance from the hwmon maintainers on what direction they'd like to take? I don't really want to push this forward without broader testing only to find it breaks a whole heap of machines on the basis that it fixes mine.
> 

I managed to find an iMac 12,2 to test with. Had to remove the check for bit 0x40 (that machine sets bit 0x10). Updated patch with debugging code removed attached for comment.

Regards,
Brad

--------------A6A834BC37CB7077A33E8972
Content-Type: text/plain; charset=UTF-8;
 name="smc.patch.8"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="smc.patch.8"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vYXBwbGVzbWMuYyBiL2RyaXZlcnMvaHdtb24v
YXBwbGVzbWMuYwppbmRleCBhMTg4ODc5OTBmNGEuLjJlN2RjODIwYmIyZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9od21vbi9hcHBsZXNtYy5jCisrKyBiL2RyaXZlcnMvaHdtb24vYXBwbGVz
bWMuYwpAQCAtNDIsNiArNDIsMTYgQEAKIAogI2RlZmluZSBBUFBMRVNNQ19NQVhfREFUQV9M
RU5HVEggMzIKIAorLyogQXBwbGUgU01DIHN0YXR1cyBiaXRzIGZyb20gVmlydHVhbFNNQyAq
LworI2RlZmluZSBTTUNfU1RBVFVTX0FXQUlUSU5HX0RBVEEgIDB4MDEgIC8vLzwgRGF0YSB3
YWl0aW5nIHRvIGJlIHJlYWQKKyNkZWZpbmUgU01DX1NUQVRVU19JQl9DTE9TRUQgICAgICAw
eDAyICAvLy8gQSB3cml0ZSBpcyBwZW5kaW5nIC8gd2lsbCBpZ25vcmUgaW5wdXQKKyNkZWZp
bmUgU01DX1NUQVRVU19CVVNZICAgICAgICAgICAweDA0ICAvLy88IEJ1c3kgaW4gdGhlIG1p
ZGRsZSBvZiBhIGNvbW1hbmQuCisjZGVmaW5lIFNNQ19TVEFUVVNfR09UX0NPTU1BTkQgICAg
MHgwOCAgLy8vPCBUaGUgbGFzdCBpbnB1dCB3YXMgYSBjb21tYW5kLgorI2RlZmluZSBTTUNf
U1RBVFVTX1VLTl8weDE2ICAgICAgIDB4MTAKKyNkZWZpbmUgU01DX1NUQVRVU19LRVlfRE9O
RSAgICAgICAweDIwCisjZGVmaW5lIFNNQ19TVEFUVVNfUkVBRFkgICAgICAgICAgMHg0MCAg
Ly8gUmVhZHkgdG8gd29yaworI2RlZmluZSBTTUNfU1RBVFVTX1VLTl8weDgwICAgICAgIDB4
ODAgIC8vIGVycm9yCisKIC8qIHdhaXQgdXAgdG8gMTI4IG1zIGZvciBhIHN0YXR1cyBjaGFu
Z2UuICovCiAjZGVmaW5lIEFQUExFU01DX01JTl9XQUlUCTB4MDAxMAogI2RlZmluZSBBUFBM
RVNNQ19SRVRSWV9XQUlUCTB4MDEwMApAQCAtMTUxLDY1ICsxNjEsNzggQEAgc3RhdGljIHVu
c2lnbmVkIGludCBrZXlfYXRfaW5kZXg7CiBzdGF0aWMgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1
Y3QgKmFwcGxlc21jX2xlZF93cTsKIAogLyoKLSAqIHdhaXRfcmVhZCAtIFdhaXQgZm9yIGEg
Ynl0ZSB0byBhcHBlYXIgb24gU01DIHBvcnQuIENhbGxlcnMgbXVzdAotICogaG9sZCBhcHBs
ZXNtY19sb2NrLgorICogV2FpdCBmb3Igc3BlY2lmaWMgc3RhdHVzIGJpdHMgd2l0aCBhIG1h
c2sgb24gdGhlIFNNQworICogVXNlZCBiZWZvcmUgYW5kIGFmdGVyIHdyaXRlcywgYW5kIGJl
Zm9yZSByZWFkcwogICovCi1zdGF0aWMgaW50IHdhaXRfcmVhZCh2b2lkKQorCitzdGF0aWMg
aW50IHdhaXRfc3RhdHVzKHU4IHZhbCwgdTggbWFzaykKIHsKIAl1bnNpZ25lZCBsb25nIGVu
ZCA9IGppZmZpZXMgKyAoQVBQTEVTTUNfTUFYX1dBSVQgKiBIWikgLyBVU0VDX1BFUl9TRUM7
CiAJdTggc3RhdHVzOwogCWludCB1czsKIAogCWZvciAodXMgPSBBUFBMRVNNQ19NSU5fV0FJ
VDsgdXMgPCBBUFBMRVNNQ19NQVhfV0FJVDsgdXMgPDw9IDEpIHsKLQkJdXNsZWVwX3Jhbmdl
KHVzLCB1cyAqIDE2KTsKIAkJc3RhdHVzID0gaW5iKEFQUExFU01DX0NNRF9QT1JUKTsKLQkJ
LyogcmVhZDogd2FpdCBmb3Igc21jIHRvIHNldHRsZSAqLwotCQlpZiAoc3RhdHVzICYgMHgw
MSkKKwkJaWYgKChzdGF0dXMgJiBtYXNrKSA9PSB2YWwpCiAJCQlyZXR1cm4gMDsKIAkJLyog
dGltZW91dDogZ2l2ZSB1cCAqLwogCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCBlbmQpKQog
CQkJYnJlYWs7Ci0JfQotCi0JcHJfd2Fybigid2FpdF9yZWFkKCkgZmFpbDogMHglMDJ4XG4i
LCBzdGF0dXMpOworCQl1c2xlZXBfcmFuZ2UodXMsIHVzICogMTYpOworCQl9CisJcHJfd2Fy
bigid2FpdF9zdGF0dXMgdGltZW91dDogMHglMDJ4LCAweCUwMngsIDB4JTAyeFxuIiwgc3Rh
dHVzLCB2YWwsIG1hc2spOwogCXJldHVybiAtRUlPOwogfQogCiAvKgotICogc2VuZF9ieXRl
IC0gV3JpdGUgdG8gU01DIHBvcnQsIHJldHJ5aW5nIHdoZW4gbmVjZXNzYXJ5LiBDYWxsZXJz
CisgKiBzZW5kX2J5dGVfZGF0YSAtIFdyaXRlIHRvIFNNQyBkYXRhIHBvcnQuIENhbGxlcnMK
ICAqIG11c3QgaG9sZCBhcHBsZXNtY19sb2NrLgorICogUGFyYW1ldGVyIHNraXAgbXVzdCBi
ZSB0cnVlIG9uIHRoZSBsYXN0IHdyaXRlIG9mIGFueQorICogY29tbWFuZCBvciBpdCdsbCB0
aW1lIG91dC4KICAqLwotc3RhdGljIGludCBzZW5kX2J5dGUodTggY21kLCB1MTYgcG9ydCkK
Kworc3RhdGljIGludCBzZW5kX2J5dGVfZGF0YSh1OCBjbWQsIHUxNiBwb3J0LCBib29sIHNr
aXApCiB7Ci0JdTggc3RhdHVzOwotCWludCB1czsKLQl1bnNpZ25lZCBsb25nIGVuZCA9IGpp
ZmZpZXMgKyAoQVBQTEVTTUNfTUFYX1dBSVQgKiBIWikgLyBVU0VDX1BFUl9TRUM7CisJdTgg
d3N0YXQgPSBTTUNfU1RBVFVTX0JVU1k7CiAKKwlpZiAoc2tpcCkKKwkJd3N0YXQgPSAwOwor
CWlmICh3YWl0X3N0YXR1cyhTTUNfU1RBVFVTX0JVU1ksCisJU01DX1NUQVRVU19CVVNZIHwg
U01DX1NUQVRVU19JQl9DTE9TRUQpKQorCQlnb3RvIGZhaWw7CiAJb3V0YihjbWQsIHBvcnQp
OwotCWZvciAodXMgPSBBUFBMRVNNQ19NSU5fV0FJVDsgdXMgPCBBUFBMRVNNQ19NQVhfV0FJ
VDsgdXMgPDw9IDEpIHsKLQkJdXNsZWVwX3JhbmdlKHVzLCB1cyAqIDE2KTsKLQkJc3RhdHVz
ID0gaW5iKEFQUExFU01DX0NNRF9QT1JUKTsKLQkJLyogd3JpdGU6IHdhaXQgZm9yIHNtYyB0
byBzZXR0bGUgKi8KLQkJaWYgKHN0YXR1cyAmIDB4MDIpCi0JCQljb250aW51ZTsKLQkJLyog
cmVhZHk6IGNtZCBhY2NlcHRlZCwgcmV0dXJuICovCi0JCWlmIChzdGF0dXMgJiAweDA0KQot
CQkJcmV0dXJuIDA7Ci0JCS8qIHRpbWVvdXQ6IGdpdmUgdXAgKi8KLQkJaWYgKHRpbWVfYWZ0
ZXIoamlmZmllcywgZW5kKSkKLQkJCWJyZWFrOwotCQkvKiBidXN5OiBsb25nIHdhaXQgYW5k
IHJlc2VuZCAqLwotCQl1ZGVsYXkoQVBQTEVTTUNfUkVUUllfV0FJVCk7Ci0JCW91dGIoY21k
LCBwb3J0KTsKLQl9Ci0KLQlwcl93YXJuKCJzZW5kX2J5dGUoMHglMDJ4LCAweCUwNHgpIGZh
aWw6IDB4JTAyeFxuIiwgY21kLCBwb3J0LCBzdGF0dXMpOworCWlmICghd2FpdF9zdGF0dXMo
d3N0YXQsCisJU01DX1NUQVRVU19SRUFEWSB8IFNNQ19TVEFUVVNfR09UX0NPTU1BTkQgfCBT
TUNfU1RBVFVTX0JVU1kgfCBTTUNfU1RBVFVTX0lCX0NMT1NFRCkpCisJCXJldHVybiAwOwor
ZmFpbDoKKwlwcl93YXJuKCJzZW5kX2J5dGVfZGF0YSgweCUwMngsIDB4JTA0eCkgZmFpbFxu
IiwgY21kLCBBUFBMRVNNQ19DTURfUE9SVCk7CiAJcmV0dXJuIC1FSU87CiB9CiAKKy8qCisg
KiBzZW5kX2NvbW1hbmQgLSBXcml0ZSBhIGNvbW1hbmQgdG8gdGhlIFNNQy4gQ2FsbGVycyBt
dXN0IGhvbGQgYXBwbGVzbWNfbG9jay4KKyAqIElmIFNNQyBpcyBpbiB1bmRlZmluZWQgc3Rh
dGUsIGFueSBuZXcgY29tbWFuZCB3cml0ZSByZXNldHMgdGhlIHN0YXRlIG1hY2hpbmUuCisg
Ki8KKwogc3RhdGljIGludCBzZW5kX2NvbW1hbmQodTggY21kKQogewotCXJldHVybiBzZW5k
X2J5dGUoY21kLCBBUFBMRVNNQ19DTURfUE9SVCk7CisJdTggc3RhdHVzOworCisJaWYgKHdh
aXRfc3RhdHVzKDAsCisJU01DX1NUQVRVU19JQl9DTE9TRUQpKSB7CisJCXByX3dhcm4oInNl
bmRfY29tbWFuZCBTTUMgd2FzIGJ1c3lcbiIpOworCQlnb3RvIGZhaWw7IH0KKworCXN0YXR1
cyA9IGluYihBUFBMRVNNQ19DTURfUE9SVCk7CisKKwlvdXRiKGNtZCwgQVBQTEVTTUNfQ01E
X1BPUlQpOworCWlmICghd2FpdF9zdGF0dXMoU01DX1NUQVRVU19CVVNZIHwgU01DX1NUQVRV
U19HT1RfQ09NTUFORCwKKwlTTUNfU1RBVFVTX0dPVF9DT01NQU5EIHwgU01DX1NUQVRVU19C
VVNZIHwgU01DX1NUQVRVU19JQl9DTE9TRUQgfAorCVNNQ19TVEFUVVNfQVdBSVRJTkdfREFU
QSkpCisJCXJldHVybiAwOworZmFpbDoKKwlwcl93YXJuKCJzZW5kX2NtZCgweCUwMngsIDB4
JTA0eCkgZmFpbFxuIiwgY21kLCBBUFBMRVNNQ19DTURfUE9SVCk7CisJcmV0dXJuIC1FSU87
CiB9CiAKIHN0YXRpYyBpbnQgc2VuZF9hcmd1bWVudChjb25zdCBjaGFyICprZXkpCkBAIC0y
MTcsNyArMjQwLDggQEAgc3RhdGljIGludCBzZW5kX2FyZ3VtZW50KGNvbnN0IGNoYXIgKmtl
eSkKIAlpbnQgaTsKIAogCWZvciAoaSA9IDA7IGkgPCA0OyBpKyspCi0JCWlmIChzZW5kX2J5
dGUoa2V5W2ldLCBBUFBMRVNNQ19EQVRBX1BPUlQpKQorCS8qIFBhcmFtZXRlciBza2lwIGlz
IGZhbHNlIGFzIHdlIGFsd2F5cyBzZW5kIGRhdGEgYWZ0ZXIgYW4gYXJndW1lbnQgKi8KKwkJ
aWYgKHNlbmRfYnl0ZV9kYXRhKGtleVtpXSwgQVBQTEVTTUNfREFUQV9QT1JULCBmYWxzZSkp
CiAJCQlyZXR1cm4gLUVJTzsKIAlyZXR1cm4gMDsKIH0KQEAgLTIzMywxMyArMjU3LDE1IEBA
IHN0YXRpYyBpbnQgcmVhZF9zbWModTggY21kLCBjb25zdCBjaGFyICprZXksIHU4ICpidWZm
ZXIsIHU4IGxlbikKIAl9CiAKIAkvKiBUaGlzIGhhcyBubyBlZmZlY3Qgb24gbmV3ZXIgKDIw
MTIpIFNNQ3MgKi8KLQlpZiAoc2VuZF9ieXRlKGxlbiwgQVBQTEVTTUNfREFUQV9QT1JUKSkg
eworCWlmIChzZW5kX2J5dGVfZGF0YShsZW4sIEFQUExFU01DX0RBVEFfUE9SVCwgZmFsc2Up
KSB7CiAJCXByX3dhcm4oIiUuNHM6IHJlYWQgbGVuIGZhaWxcbiIsIGtleSk7CiAJCXJldHVy
biAtRUlPOwogCX0KIAogCWZvciAoaSA9IDA7IGkgPCBsZW47IGkrKykgewotCQlpZiAod2Fp
dF9yZWFkKCkpIHsKKwkJaWYgKHdhaXRfc3RhdHVzKFNNQ19TVEFUVVNfQVdBSVRJTkdfREFU
QSB8IFNNQ19TVEFUVVNfQlVTWSwKKwkJU01DX1NUQVRVU19HT1RfQ09NTUFORCB8IFNNQ19T
VEFUVVNfQlVTWSB8IFNNQ19TVEFUVVNfSUJfQ0xPU0VEIHwKKwkJU01DX1NUQVRVU19BV0FJ
VElOR19EQVRBKSkgewogCQkJcHJfd2FybigiJS40czogcmVhZCBkYXRhWyVkXSBmYWlsXG4i
LCBrZXksIGkpOwogCQkJcmV0dXJuIC1FSU87CiAJCX0KQEAgLTI1MCw3ICsyNzYsNyBAQCBz
dGF0aWMgaW50IHJlYWRfc21jKHU4IGNtZCwgY29uc3QgY2hhciAqa2V5LCB1OCAqYnVmZmVy
LCB1OCBsZW4pCiAJZm9yIChpID0gMDsgaSA8IDE2OyBpKyspIHsKIAkJdWRlbGF5KEFQUExF
U01DX01JTl9XQUlUKTsKIAkJc3RhdHVzID0gaW5iKEFQUExFU01DX0NNRF9QT1JUKTsKLQkJ
aWYgKCEoc3RhdHVzICYgMHgwMSkpCisJCWlmICghKHN0YXR1cyAmIFNNQ19TVEFUVVNfQVdB
SVRJTkdfREFUQSkpCiAJCQlicmVhazsKIAkJZGF0YSA9IGluYihBUFBMRVNNQ19EQVRBX1BP
UlQpOwogCX0KQEAgLTI2MywyMCArMjg5LDIxIEBAIHN0YXRpYyBpbnQgcmVhZF9zbWModTgg
Y21kLCBjb25zdCBjaGFyICprZXksIHU4ICpidWZmZXIsIHU4IGxlbikKIHN0YXRpYyBpbnQg
d3JpdGVfc21jKHU4IGNtZCwgY29uc3QgY2hhciAqa2V5LCBjb25zdCB1OCAqYnVmZmVyLCB1
OCBsZW4pCiB7CiAJaW50IGk7CisJdTggZW5kID0gbGVuLTE7CiAKIAlpZiAoc2VuZF9jb21t
YW5kKGNtZCkgfHwgc2VuZF9hcmd1bWVudChrZXkpKSB7CiAJCXByX3dhcm4oIiVzOiB3cml0
ZSBhcmcgZmFpbFxuIiwga2V5KTsKIAkJcmV0dXJuIC1FSU87CiAJfQogCi0JaWYgKHNlbmRf
Ynl0ZShsZW4sIEFQUExFU01DX0RBVEFfUE9SVCkpIHsKKwlpZiAoc2VuZF9ieXRlX2RhdGEo
bGVuLCBBUFBMRVNNQ19EQVRBX1BPUlQsIGZhbHNlKSkgewogCQlwcl93YXJuKCIlLjRzOiB3
cml0ZSBsZW4gZmFpbFxuIiwga2V5KTsKIAkJcmV0dXJuIC1FSU87CiAJfQogCiAJZm9yIChp
ID0gMDsgaSA8IGxlbjsgaSsrKSB7Ci0JCWlmIChzZW5kX2J5dGUoYnVmZmVyW2ldLCBBUFBM
RVNNQ19EQVRBX1BPUlQpKSB7Ci0JCQlwcl93YXJuKCIlczogd3JpdGUgZGF0YSBmYWlsXG4i
LCBrZXkpOworCQlpZiAoc2VuZF9ieXRlX2RhdGEoYnVmZmVyW2ldLCBBUFBMRVNNQ19EQVRB
X1BPUlQsIChpID09IGVuZCkpKSB7CisJCQlwcl93YXJuKCIlczogd3JpdGUgZGF0YSBmYWls
IGF0ICVpXG4iLCBrZXksIGkpOwogCQkJcmV0dXJuIC1FSU87CiAJCX0KIAl9Cg==
--------------A6A834BC37CB7077A33E8972--

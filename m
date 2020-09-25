Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54792278FFA
	for <lists+linux-hwmon@lfdr.de>; Fri, 25 Sep 2020 19:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgIYR7W (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 25 Sep 2020 13:59:22 -0400
Received: from sonic315-13.consmr.mail.bf2.yahoo.com ([74.6.134.123]:33557
        "EHLO sonic315-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726401AbgIYR7W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Sep 2020 13:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1601056761; bh=dmrXGoOcSWMF2SnlezJ+xBbgkxN4SQugvVtmdIdRXqU=; h=Date:From:Reply-To:Subject:References:From:Subject; b=rH8wJE05pnxeZmu5i3Tt1FaoWCSflFNdgbminXM4a2Sg1/CftnmCyhOsZRCXwcImXzasrxptvlRIDu7tE4tJ6pd6BZse7VQmlzW8lBJTwLtTZ8KXQFHLus/gyIDxq8WHUXFvdbHQyxXWop/r2PZeQThCNYE2BhYEWym1QczciLoprlGY77f9bOxyJjNUv5Ps8oELH14kH31fa62d84a+TK+y7ntpF0NufehT7Efdp8PDNVzGCXevDfRjqOjUNtAPAQGZRK87UWdf/sG6hyPgfJV8zFW1da3xkPTK+E1SsQwLH9KbCD03X6rMSkPWpLYKL07oqLGBJfNCFcNS+nNosA==
X-YMail-OSG: 6Cfm2loVM1kUXIbAIDfYSXQ5lbG4Ywvx13QEKwbwkisBPkPZNn2qxhG8O3WR6tY
 FGvTw4agbTIXA1_oFuVR_w1EknN.3yyRK7bD7zel.agJDg_HRx7EHwgF0gamecM5rtzXn956oezT
 steOQE03JzIjHeGsReUPmDxiAulJApd4cGygdKGBFanENp2oRMFaD.2nh5reVgro_BmY3fjnkxWA
 pq1BJndOP9GSl5nlLi3_JD1UB82jUJPaJlC1x9xNNiAHgmUgckCa4fJSrzN91eKL88b0OyNVGlup
 1mAxQak1L2t3Pxnablz7aVQuNuZoZw2i9iVgsvsGDoXzFjVqSPASkE5XuM4OgjM7z3Bci4UMJwZy
 c2Z7i5uqiFtk7bTL5nof6lUwmcwNA97CoJMMfJst2zYYIIeBDzmCtz2PNCmfpzjkk.SrCbi18JdZ
 SBJvx33AFf0ew1YbNz8TQpzgNgs8ZuKz0xgHxfAise7gKXDqmDo_CAYttFJr4oH4JbW1sCpHCQum
 3xqD2DWHicy4EHI76qWekSZBNpHzbAcWPqrg5orYuESchSdTO6Qwdm6Scchh3Z_ms3EeKj8YO93F
 zWEKqKPoWaE6NmBmiJ97J_fSF8wfNycxeAORlNr3GJtwZqO.vR.f.pWwUdmqHrHUHdDYPcOyJG6d
 tIb0_HCIuP7h6CbflCxJdEVit_OCtwe.vgLTTEv2bIqwu74xZHYjOK8nl.lo96u8vH5dQbdeJXX1
 RHdP7kO35r6_8oAEPtefyo1AKFsUfxcf5AGcBrFMMrSt8xoA6mPfme8C_GvgrR2qgFBGTi0v6oev
 Kl1.UkExNi8g5Hw2dzhhLa470hwfGVXsVz6gWh0NKM_xKYUaFM3EkV9MZau2voNBAgI8aFLF0Zts
 WKLuiy0RXw3ZedOdNfu3qj.PhGtTv.GzuhFdOtQ45jWhWqhQNLbvpkJEPCRRpJJ3VOvVaQncak5A
 2naqi5KgsP0lT5KJmRaxipAS57y5jnww7a_x8PApVuORN6KtqZpat2KX6MNt8GqAKrHkeh.5M3v9
 .P7_nAHmbpGoMvfnfZkkjiRVaje3DLDr7Tn0u4ad7s.1JPXB.nakmYJ5IQGsWNP.RHNfKlpqhQzm
 407wO0hNf6PMEPgS1aPFRRk1827d2LqsnSLDuNCAy0.O9uEgsep2DPqa7mEe9vQ5v7ydOX_OV3FM
 piQwTku2DScd2S.2AY1ROMnSJozhKIYkYOPZJMls7RSSxZoK2r1nkKh6eDLelmGrYkWHqe4wlkc.
 YAoGdTmpmVsusBh.YxgT7ejzpgHgCI2R1fSYUcxj4eXq3oXSYGqwvBIBdJsLHEny9Xy2bLga30Ut
 8A931KNWUMV_r.hWIF_rwrQIE1TpjHuZSxAyWVhfT.IAT2DWmPTE_iRcr1uY7bvPqkYyowUrka8t
 dftrfnrLWZIQcIchfVde9ckq4GYuYb5hrVJgU6wYgUOBtCMY-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Fri, 25 Sep 2020 17:59:21 +0000
Date:   Fri, 25 Sep 2020 17:59:18 +0000 (UTC)
From:   Lila Lucas <lila.lucas1112@gmail.com>
Reply-To: lila.lucas1112@gmail.com
Message-ID: <1802826262.759309.1601056758633@mail.yahoo.com>
Subject: Very Urgent
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1802826262.759309.1601056758633.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16674 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



 
Hello Dear,

I am sorry to encroach into your privacy in this manner, There is absolutely going to be a great doubt and distrust in your heart in respect of this email, coupled with the fact that so many individuals have taken possession of the Internet to facilitate their nefarious deeds, thereby making it extremely difficult for genuine and legitimate business class persons to get attention and recognition.

I am seeking your assistance for the transfer of Fifty Two million (US$52,000,000.00) to your account for private investment purpose.

I look forward to your response.

Regards,

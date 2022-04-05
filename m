Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585FB4F53DD
	for <lists+linux-hwmon@lfdr.de>; Wed,  6 Apr 2022 06:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245597AbiDFDtt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 5 Apr 2022 23:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573095AbiDER6G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Apr 2022 13:58:06 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D34E617F
        for <linux-hwmon@vger.kernel.org>; Tue,  5 Apr 2022 10:56:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s2so160463pfh.6
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Apr 2022 10:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=qsNfemz0v0GX/YhtOsQt1I1OxkAlWpdfoOMrntuX+arLQc/wxF8yi/12yFAYon5eKO
         en7hNke0Trui61pl9hXUJIbDj34YyLN49wzVMiagdD+aEH4K6SVNFS/6x4LGv+FrRQ+5
         CLTnwDfcxzCAXL3JAWq2Vn0zB+ufkEmiJsT6f+qMUt0m4KXsQLQlt2wevwul/mZ2vUh7
         H5+sFaUM4qmSMNcXSNPG1YSu8XsnoX/sxGsI95rQGKmoatzY5uxR6MRMoVO0F+cQiRR7
         EIkIxumcVcQ0IGekI2HcOWlQ0bXVHwspAuamnkwXeiP7Gf3kNyfRzom1wZ1FDDfJcFzO
         V0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=XZ5+bO9LTC1a/PPV39vCW99hZ0XRQBeqqFMLCI42lAOg2j1ca29IpqWqaHZBDHPvrY
         stOuydrEEsEfpzejuhyEjECi3/YwSwpY9wOXbtyNm8+Qv9R7Icy00iaNUCouWzV11DG7
         CSlGGoJCrOkrSDmWodTHXad25HkuMuvrkQBJNuHDf53ZnbqLVAne+9bvnCa616lrzhiM
         b4ROYufT4OXYDJFBEC+6/QUwsaNHFi2Y8hIMl5t1AdSRr/fFsIIEfri2tGRV1h1T3FyQ
         Xw2nrwIvzxQolS6tp2pi/qDdtCjRd3cf2vwtpMZfMmj+Jr49Z4uzNujQk2cgGIEX0K7L
         9Klw==
X-Gm-Message-State: AOAM531kioXdHDYwbM/YPFgpzOkU2E9LeGiQjIyY8cUmMPIEHigd4KVG
        AbdLqBIDIfdUyU+yRJ3Dq9ZFM1+tis1JWhioCjM=
X-Google-Smtp-Source: ABdhPJzSM9VdGhPJmctVEo9V0PhjPzDtLJnPzDtjCElUjhpx3+o7Kkv4AgPjsGpFcJlnJ4qB6b/KGkkfIUBaOctHVWI=
X-Received: by 2002:a63:7804:0:b0:398:1338:86a with SMTP id
 t4-20020a637804000000b003981338086amr3837200pgc.575.1649181366620; Tue, 05
 Apr 2022 10:56:06 -0700 (PDT)
MIME-Version: 1.0
Sender: info.unibbf@gmail.com
Received: by 2002:a05:6a20:8917:b0:7a:ea94:3932 with HTTP; Tue, 5 Apr 2022
 10:56:06 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Tue, 5 Apr 2022 19:56:06 +0200
X-Google-Sender-Auth: fWs3RsVF8N-FPLl8w6MvjNwGZ1Q
Message-ID: <CA+Ps-gJqRWth5xJ6Zi5Q9PwwyYrNurxLgu0GvR8iYSaOoXtnDg@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        T_US_DOLLARS_3,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:444 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5882]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [info.unibbf[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 T_US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        *  0.5 MILLION_USD BODY: Talks about millions of dollars
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ATTENTION PLEASE,

I am  Mrs Aminata Zongo, a personal Accountant/Executive board of
Directors working with United bank for African Burkina Faso (UBA). I
have an interesting business proposal for you that will be of immense
benefit to both of us. Although this may be hard for you to believe,
we stand to gain a huge amount  between us in a matter of days. Please
grant me the benefit of doubt and hear me out. I need you to signify
your interest by replying to my mail.

Honestly, i have business transaction worth the sum of
(US$8,200,000.00) Eight Million two hundred thousand united state
dollars to transfer to you through proper documentation in position of
your own Account.

Most importantly, I will need you to promise to keep whatever you
learn from me between us even if you decide not to go along with me. I
will make more details available to you on receipt of a positive
response from you.

This transaction is risk-free; please urgently confirm your
willingness and interest to assist in this deal, I am in good faith
and with trust waiting for your Urgent respond and maximum cooperation
for more details.

Best Regards,
Mrs Aminata Zongo.

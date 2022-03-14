Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C22D4D7F68
	for <lists+linux-hwmon@lfdr.de>; Mon, 14 Mar 2022 11:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbiCNKHh (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 14 Mar 2022 06:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbiCNKHg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Mar 2022 06:07:36 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E3537ABE
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Mar 2022 03:06:26 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h14so26089904lfk.11
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Mar 2022 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=l0vc3pZ03Wfnz46X6NLAGJyGb0xMYk/hF1gdFFbZbatem9XbSZ+AtnC/iE28Ij3Ilo
         pgEL/7MvD0HLnoYe7JCpd0fsL6TupyYHYHMnIZNJSVpdu6U9FR5YMiJKbQ0mvSIc5dSO
         uzhR3iQ2u5HgpiZPjo+grWV37o3fiKArvEtmNhVBsAHlPH8FTlnoB7J8ix8senQ/FYnw
         WowHIVrhOpOFTORKx4wrGg0phxO1v4Q2PkozEE4DcM1+y76i15LlRhM+LC17ddRRhYB0
         hTs6hpTze5ZcutZwzR3bzptsHBRHkOfjteap39ZqyDaTU9VO3YNH1RJ1Xt4vUX0kKkSM
         hnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=MXFZhh5DKjmo+6it6l3LaiuDX47JyJTLalDhVRhSCdHmbGF/qVR7pp6/+Cghij6EAY
         E6Grr9Bsidpt8IN2qMm42fv8LhJUxslCplYX0jlXFubhzOksl0WNyYvf/o/AiV5gCFRX
         EYlWA7JYNRqjkF9vmxA0FEqK9qVjwJuUmFxqz2yvMZ4fyU3Uajs7Obbm8CDfa54LJ3xv
         WqrinxQloPi7ZbtF2ANoAZd521sq48c6jdpuXYZnteGmRVQ3MmBQnXZHqOcItcwK86F+
         55YiLdyWlJpTNAoCUrA+h9yoryFYeGlE++rKcojWlgtunWF5x552nSuSRgiiKpk9YeB+
         ac5w==
X-Gm-Message-State: AOAM533RtHtVQnbtqAgbjFZm6oncNPrWpnyv9I/pVWIW/rtd+R3HfTbq
        rsl/k9GByJHqTPx0IAOzc/wTjaXfBPJrDzEt2pU=
X-Google-Smtp-Source: ABdhPJx2pJYOReLK1aXcElwoJa/a9VmnMuc48O/tjIihJpHJ7CWc/ufZJhOd/LPTKNdVK8pY/TvUB/NoXx0PMyqdw68=
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr6844428lfs.27.1647252385213; Mon, 14
 Mar 2022 03:06:25 -0700 (PDT)
MIME-Version: 1.0
Sender: silasokwudiridavid@gmail.com
Received: by 2002:a05:6512:34d2:0:0:0:0 with HTTP; Mon, 14 Mar 2022 03:06:24
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Mon, 14 Mar 2022 11:06:24 +0100
X-Google-Sender-Auth: fjklAHmfjys24l5lMm9CSIKK_NI
Message-ID: <CA+PaGgT8WQXV332hOwNC5BYT4_7R9rF1H=d5xUiG97U470ScBg@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:141 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6586]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [silasokwudiridavid[at]gmail.com]
        *  0.2 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  2.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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

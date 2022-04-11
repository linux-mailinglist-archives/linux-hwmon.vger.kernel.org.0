Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9DEB4FC14F
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 Apr 2022 17:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348208AbiDKPq4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 11 Apr 2022 11:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348203AbiDKPq3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Apr 2022 11:46:29 -0400
Received: from mail-oa1-x44.google.com (mail-oa1-x44.google.com [IPv6:2001:4860:4864:20::44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82558B1F9
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Apr 2022 08:44:13 -0700 (PDT)
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-e2afb80550so5749913fac.1
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Apr 2022 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=UCGy0wR2zF82kRFIScRxIvoKC2b4Z/VBtRLO1dl4xw/o5Ah1RRS7Dcxl4vzJxZZbaK
         t3Q/aBJ2eqAz5T/6aVgwu2M//G6zEEgqe1DM3GAC5ATJit6aEh1C3dPoOfQFC34H0gkJ
         9FwjjGlBdyS79nMPmN6uFKziH+/D0QEieiimpDwrmUnBLEt4Qfu861Wtz379V9e2FBJV
         bLRmpRAiS/VKiEMVoFGn3ZVEx6StJoLFyL8LQVYgHHrupGYpHg14ziB8KJB9krMFH7HU
         h2xnNvvUqBqXFjARDF0tU1e3vmawhgKdtUav/6giBqCngtFfXgY5LTPlcSEJMGLPYtXT
         cyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=U/TIWGQlRgPgaB67aBR2nGVd8RNbCdOHYF02+dBaWttARnBETRTuAF5ms+x3iOHaXE
         8tNtZPi8qrtoDE1n0kfEwBqNiTxjVY/z+kY3nOcZfc/9oon/G/fv6whJ8X05awOI77af
         vO0vsqB1rO/nEoNenzY+NuVDYYNuEnzXm//ZtOV+DTT/kYfTPJ1DPwJaPSubwu3jknQJ
         AMMOLe6SSKYnpVXxskwSz+Sg0BF9i3/BgUFWB7f/uYJj54rBrPr8fcy4gFl6LFYnFx9n
         HlDExr/dMUFOpJLgNzcE7z10cvmry4l1GERPT28vhBvpztx3HQQZ/xk5IgQTQPtTITyy
         3lCw==
X-Gm-Message-State: AOAM533kli6hAOPQUjKPFCfIN34J8WdHlhwIooPum3Ha1pR4DPtOALjz
        01T4ouQwS6kBW8aM30eRcvrsZqxE9NErPScz2Y8=
X-Google-Smtp-Source: ABdhPJxUbs4pbBsCd++hclhAL22XE3Hwe2MZjl7GZLZ1I+x+jpXGpno0EgdnTGt/ftmfj5pOoKB/a5Puprh9YBsr2/A=
X-Received: by 2002:a05:6870:350d:b0:e2:a6e7:1f44 with SMTP id
 k13-20020a056870350d00b000e2a6e71f44mr5187783oah.168.1649691852648; Mon, 11
 Apr 2022 08:44:12 -0700 (PDT)
MIME-Version: 1.0
Sender: eldristanko@gmail.com
Received: by 2002:a4a:b682:0:0:0:0:0 with HTTP; Mon, 11 Apr 2022 08:44:12
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Mon, 11 Apr 2022 17:44:12 +0200
X-Google-Sender-Auth: rf-4_195gI7eGSmYqDD8_Ij2vDc
Message-ID: <CALry08UyJUDX0U0aPs1BioRTXAStcwsxt4k9HDbeZ-hD1fRHoQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_NAME_FM_MR_MRS,
        LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,SUBJ_ATTENTION,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:44 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5010]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [eldristanko[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.1 MILLION_USD BODY: Talks about millions of dollars
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
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

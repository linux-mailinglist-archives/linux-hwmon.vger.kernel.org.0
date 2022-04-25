Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C98350ECD0
	for <lists+linux-hwmon@lfdr.de>; Tue, 26 Apr 2022 01:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238012AbiDYXuW (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 25 Apr 2022 19:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiDYXuV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Apr 2022 19:50:21 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B1E205FC
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 16:47:15 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id f32so15963622vsv.1
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 16:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=e5CcvM86AXwBIr0iBMCjtWvOPrCxYFOFu4qcGIyWaGJr46TxqFvoosiEVy0zgrhZCg
         OaBBYlmZ3LkEnhit02Q/9DeDMQ42NFqPIJyq3TTpcjPyNVVmeH6hfDwtlaL5ABlWEPv8
         Ft/8ZS0L22fY/3T7ipfKeRtF4OC3Tm4+mJRpZCmkc2YryuHuJb+vx0ZxLvNss9TggEHj
         prW1mBHmVyI25EUeD8yOwQAzZKWyPF7m4/AlwvvUHWc1dWRYclyCcnJAkFuU71SXCXlC
         eau5wEl28UHVJn2nD8tjExqr7Wde6dWQNMO4lwnHJQ99sgDHTw1HXGqDaqTJyrPsvbM4
         26Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=rj3WfJOXpqTqpspEW8wMXafJRU8BdgIDYPeBXfAUcWV1rss71MTN9vOOwCl/iHM6QO
         hSvIJSiqr/x97xY9Y8ZbTZvBvovwgoOyFenZN6cNXyUtFBl3uaWGNtGGHj8L6oHfm2rg
         7xfQTmyWcu/1GJ5vDXTQhBGiDNmVzWJB+kTphRh/W/xbJ7S3PMP6vVqkWqdPo5DoqLAs
         4PF3AgrnFP4mY/IC542sML+uxse/2fVJ7TGAFt9SeqeKSpnywbUvA0sMh0jOBBs54T6R
         9yuoZzibPEgF+g0wYFCowmrwYAYRz9bmne1jFPIxTL8YX/l0U2RUD/hVVemWapffyoRL
         HRAg==
X-Gm-Message-State: AOAM533aS/+/bk75MFyw1RdaxEg2M/O4TLFcy8VkGxcKN/LJ2lf5Xwbf
        teP3e650NB+GntvxoWq0KexPE+hOrAYAeRH6TJ8=
X-Google-Smtp-Source: ABdhPJzvGB9e65z2BKD/TYIZiTItSypWTEEy/miQ6N/zxODpeqniELIewvpf8whZGtmyf/kqExDN1IuVx3+j07SFR14=
X-Received: by 2002:a05:6102:3a48:b0:32c:c8d9:cea6 with SMTP id
 c8-20020a0561023a4800b0032cc8d9cea6mr2475015vsu.41.1650930434978; Mon, 25 Apr
 2022 16:47:14 -0700 (PDT)
MIME-Version: 1.0
Sender: vincentgeorgeag1@gmail.com
Received: by 2002:ab0:67cf:0:0:0:0:0 with HTTP; Mon, 25 Apr 2022 16:47:14
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Tue, 26 Apr 2022 01:47:14 +0200
X-Google-Sender-Auth: HQzQadDCQF6qnJoubZqkk2CtvqI
Message-ID: <CAENe5cs3StK0orkKLO424rm8P00QyJ-V1qiA9SRB2ZHj4RhwZA@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,SUBJ_ATTENTION,
        T_HK_NAME_FM_MR_MRS,UNDISC_MONEY,US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e42 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7135]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [vincentgeorgeag1[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [vincentgeorgeag1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.9 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  2.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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

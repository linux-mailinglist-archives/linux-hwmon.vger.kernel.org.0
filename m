Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5EFF4FA812
	for <lists+linux-hwmon@lfdr.de>; Sat,  9 Apr 2022 15:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbiDINPA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 9 Apr 2022 09:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbiDINO7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 9 Apr 2022 09:14:59 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB4F92864
        for <linux-hwmon@vger.kernel.org>; Sat,  9 Apr 2022 06:12:51 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id b15so12945496edn.4
        for <linux-hwmon@vger.kernel.org>; Sat, 09 Apr 2022 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=PuWoiAuWxd/Z6LY57ALykPtpkYVF+ijDEln+h8cSfy3C6qzgYrmmwXAK/X1Xd4A+xC
         j013bqjPLgu0vvHVzHMsNuAxwSkxUUjxKe8bAK/A9LWHBRzmV+Z8jZkKBbgEWvSRhpb2
         NZC+O1LSmxoMwRwfgRJMkVrc4zjchrLCDsLULQmNmkh5kQlxDiLF7fKtomKxT2vqMCcg
         DRKfrP6+6EY14DQK1+wOZfVuWBHDokVk/zUz4ZkR9K3PlouVB9MmKxoBCMwLjI1hmyK1
         0KHXWd/x+WM9lWksGOvzn0m8zJF3I07ZV6dfac4U8J1FiVjBcEtc4qQN0wmFITk1H0bM
         PziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=YkvP2/mujEify+Zxalp+/VukaAxZjAwjHSZKRklYs6/rWlJzu2IsTNCiLupS+YxsEl
         zkS7xzExRybiZCiIO5DuL0vMlRWf+IXvwnEST+hWA3Th2COfDXMin8BhG4jipY4LVQx9
         D8nsO4EVAdWj8IiSY162DWdAJEit6qowap2QIqmwHqrWYhlma9APIu8fsfkvhP8BC354
         4iPqKwby0m877Y3pWtJ8+fly5HPZZKNrLZU/CuhFC8vqxefmgsxTP9lD99SEl/IeHqCw
         yXSYompakDm+o6W9myBMcjyLH4P5sGbiYGPoct2EtlmqxADiEv5m5hyg1JQLdXHArLfm
         tSHw==
X-Gm-Message-State: AOAM533FbeAvanjKsZ5hjI4/xjNsrw+zpUn2CTwHz5s3UQdj69C3f0hH
        LHY2YHqxiWZ8vGej9r9omTdxKeUYKfOBxS/k5IE=
X-Google-Smtp-Source: ABdhPJwiAR7gAWpA+6kM7UwPpA6kHn1p/iTUacC5ghURcpNNG34aqdT2iyQ/PzQDa+nvJkKsnBCiL4lO7oWHqdw7/5U=
X-Received: by 2002:a05:6402:2682:b0:41d:2f74:7269 with SMTP id
 w2-20020a056402268200b0041d2f747269mr7179633edd.255.1649509970421; Sat, 09
 Apr 2022 06:12:50 -0700 (PDT)
MIME-Version: 1.0
Sender: compoeredrahmed@gmail.com
Received: by 2002:ab4:a070:0:0:0:0:0 with HTTP; Sat, 9 Apr 2022 06:12:49 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Sat, 9 Apr 2022 15:12:49 +0200
X-Google-Sender-Auth: Y_Gl3oMWCIPYRU3Oir3n3jA55vw
Message-ID: <CAAdcN=62n9giVjwBn-JeFX+NYS18+9SMyDxmaGeJPJzBHv9wWg@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        T_US_DOLLARS_3,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:541 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.9260]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [compoeredrahmed[at]gmail.com]
        *  0.2 MILLION_USD BODY: Talks about millions of dollars
        *  0.0 T_US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        *  0.2 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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

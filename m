Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2464E2C40
	for <lists+linux-hwmon@lfdr.de>; Mon, 21 Mar 2022 16:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238242AbiCUPa3 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 21 Mar 2022 11:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348709AbiCUPa2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Mar 2022 11:30:28 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0BA2657D
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Mar 2022 08:29:03 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 134so6177396vkz.12
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Mar 2022 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=YKrPh04xmEFPcaYx7ShXDzsOOpepqNHXUyOjG8T/N661/LSfitbT+Gus2dQ7DDLgy3
         8bupsLgYm4JD/CmCqpTMuessM44Mb7zA5fB4YcA9P9OlJHL1PCBsUUj9fGlEOKWWXoHv
         xP34l3oG/ekJwwITaNGQtqoW7PMoCefkNtE/2Xw6UVaiQ6o4SvWbMJvBCVXPPQXqx5vV
         RSAuMnGIenHvVzGhh/XZW35f3SEypxAN9yHJwWJXfJvG2UcHSzR19bRALmFZatdwGBt4
         ulnykE3gZuWlXOneHSLjInj71dS2HC2Gx/wPp/edfCeDmgGcRUVTMT+GeceZZVXvpcWb
         KUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=RkZoXIUWi4TRwty/i6rbnmt6uG4+N6ztAEozxL671+0kxnB+GhtelTzatp7oXjWzDx
         ljnnaaihMwVKSLL/cXBrmUjgZ7dwAoRD+wsZgthBZfXjMgbV33+9odS+wpt5/+79zWah
         /LP2Ms2VLrlhR1NE7ZfEHl0qlttZoPjWokAksiDEnsF9PJRplMbLzufunJXiN6Zp8zTD
         1LgDykwX5pWUIzqQ1SfkhIrFBKR/ses7RkzxVy7oigjjS7xq0gaBZj9Ra//T0v8TxcBA
         9rBzmM6NhWZPZzMiJGw9Hh87N8itFdTpPnlxsJQ68UAtW8itKpSMpgbs5onugmzGo9CB
         cP2w==
X-Gm-Message-State: AOAM530zBts+6fimtcv2/5o9SSjgcFt6Y8YMp+b9GuxkUXRS3MJLJQIp
        CMPpuI6O4t0C+weOrBMZbyuNiefn9ob1U9C1ywU=
X-Google-Smtp-Source: ABdhPJwta3pMnBzG9vPkweZLb1pvhwcfEZ7Ii06zZ0fHEllauvk2iQBAqwZ5BxgjjkDmgpxRF7zcorJbJuVlwRKvQfQ=
X-Received: by 2002:a1f:5005:0:b0:33e:fb61:2108 with SMTP id
 e5-20020a1f5005000000b0033efb612108mr2303006vkb.28.1647876542180; Mon, 21 Mar
 2022 08:29:02 -0700 (PDT)
MIME-Version: 1.0
Sender: info.unibbf@gmail.com
Received: by 2002:a59:c32c:0:b0:299:74ba:322c with HTTP; Mon, 21 Mar 2022
 08:29:01 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Mon, 21 Mar 2022 16:29:01 +0100
X-Google-Sender-Auth: _LTYHWnBFxjAzS3hGz32MnzDewA
Message-ID: <CA+Ps-gJ2BJo-baZNY+iUFxeu3v+PLCfuyi7fnh28pCRVMmDSYw@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a2b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5060]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsaminatazongo[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.4 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  3.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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

Best Regards,
Mrs Aminata Zongo.

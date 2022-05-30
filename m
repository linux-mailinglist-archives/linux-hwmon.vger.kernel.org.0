Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B91435386AC
	for <lists+linux-hwmon@lfdr.de>; Mon, 30 May 2022 19:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbiE3RSj (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 30 May 2022 13:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbiE3RSi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 May 2022 13:18:38 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398925F8C6
        for <linux-hwmon@vger.kernel.org>; Mon, 30 May 2022 10:18:37 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id f4so11880035iov.2
        for <linux-hwmon@vger.kernel.org>; Mon, 30 May 2022 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=War3Yi9zM6VCze97oOGD7euXSxWWDNMBpiFO+qJv7Ak=;
        b=HH+ny2rcwRdv3a1W1klBn+bRg7Z1LD7VaEe7+LCPTYraayhHnOGGHvpL5e3g6Vhjxp
         sJw2perhJ4IhYdPQWm5QxrvujNVcOBidl+yNIBqxBgnCy2WiBTxL49Rxf+i0L7RFIKJl
         p2W/9jNp4dAM19TXHLGW/ctEPdsj6is+hzEryJ5fV9p4hOc5amkO1Qk8mFhOf6OmTuVU
         I9CBRhgNkK31bYF13syOGCVNq7af2/tMrArjOxcV53UNoJxoIBYx0KGlar3MiCA1YJpK
         hLFKoA8DyR1aEsEsdEElTJul7+2UyvS0tpkULztuXQCYu5LXMY/WiC1MBZ3i0TTXKm40
         nFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=War3Yi9zM6VCze97oOGD7euXSxWWDNMBpiFO+qJv7Ak=;
        b=oksi50NZ+0TaPm3oyqfzCFN4LGZOkffDSLaBDwLs0+eePEvHGxPSjfmb7YhaeTTcZ2
         1xCJcyp980207SdAaJFyd41MK2YIVHNkkGAQWCHKrI4ZLz4scOC4bHqKE4SjTwJOMcC+
         8g7Rdjm09YLE+bITalM/cNQmo6VMtLZFVeFnCEh6B1o3v0xz+H94xuG5MZw3Y3fdjkcF
         LAn/kXnTUzcYfyOYDJgMq+wjvBl5MtCJMTHXna+BfFGMnmFvCJGD56OgwoOg0XrYFf4W
         +5IKjS2KMJmNc/O25TdzGPSTzlEomfrTcocstthvCxJ11qsV+K0ZCjOr0o6CMstYak82
         /WQg==
X-Gm-Message-State: AOAM530e/VT287dlqW9V2vY+xA54j8yF1Ihkck31StWYxNYs0Gjt8oUM
        +cYXdvbMxAEMDbYSKp1veIO/M3UZCwajFhJ1yxg=
X-Google-Smtp-Source: ABdhPJxqArUkBJ7wHPhmM1lW9JcCsG39xON8L2gNSx2mt1hi1cJOCKERe92UrAmIEHX8e/EYJm379Dk+RFGLCVNp+B4=
X-Received: by 2002:a6b:b591:0:b0:668:a264:e4a9 with SMTP id
 e139-20020a6bb591000000b00668a264e4a9mr3070455iof.59.1653931116678; Mon, 30
 May 2022 10:18:36 -0700 (PDT)
MIME-Version: 1.0
Sender: centralcatholiccathedrachurch@gmail.com
Received: by 2002:a05:6602:13c2:0:0:0:0 with HTTP; Mon, 30 May 2022 10:18:35
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Mon, 30 May 2022 19:18:35 +0200
X-Google-Sender-Auth: wAhVPTy-CXAGjDGy4x0XXYREc28
Message-ID: <CAB6FKmqyoFU7VD=Vpsz46PMr8Qxp8d6MJ+m8dYKEVu1F6L6w1A@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,SUBJ_ATTENTION,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d35 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [centralcatholiccathedrachurch[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  2.0 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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
your own Account

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

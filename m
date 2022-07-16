Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0DFB57702A
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 Jul 2022 18:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiGPQkk (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 16 Jul 2022 12:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiGPQkk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Jul 2022 12:40:40 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656101D0FA
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Jul 2022 09:40:38 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id w129so2617153vkg.10
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Jul 2022 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mG/QaiwlgsjyXmDGHTqTaoM+kkOKtkeGG3dxD5l5egg=;
        b=FuS6j9TwBThyHbof401mAMj8YyXqIseZ6eekNvry8rC0oyFpQ/N6OYSdMFZrEbpZv6
         Tjl58p+rQFJ0WNNNraPUvPScQ/xC9ywaCdO175h+iu7gu3O3bHV3KfLr3IaoB+odFjvG
         sCUvbP8fw4DWlgiAKMitAxbnta7IIjgqXCvPMxy+gIUYx9be30a6RYHP3Ffrkq9vRRJt
         iyJLg5V2huo42ZnZxnnpEK8yAClxRCBJ93tEG2+5ng6h2wMhUqJx0yBqoX1JQvsVPSSk
         4MctyQVam0Ug4D54CP1+eiG/VvALYKDIz3yli0TuEsPofTN2tnQ44puYqZD0h20qQ/NX
         PqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mG/QaiwlgsjyXmDGHTqTaoM+kkOKtkeGG3dxD5l5egg=;
        b=03v4jLZMCQMUby8mAmHlKSSXwKATM7UbIH6OGbKfypA4zLxWezrBHuHTQLDAsYS7sE
         2ToAbLeRCiaTEKquMdXI87ThhABYde4vZBBKBNKwTUa1x0XSwIJSqoL2hXWQ6VhcRzjq
         Z/UpmMO3c/KjDhEUw/0uDH85zPjQ+cjAe74N+kzpvl11y+6PzoxJvpazNIcZmNMg2drm
         OdHFCOGjjQ79uDvx90NZMyjI6k/XJbanHwnuK975VBuShz++3xBorhfWyvs3pozyJkhF
         gdsRvcQs3X7LIzE17T8c8i4GZI6mBYFaaUxBQPxwUFSH6bl1OdV4JJgowocQ08N2ydiI
         1iZw==
X-Gm-Message-State: AJIora/EibHqkTADloHV19P5SEtx1uWjNoncEk5VrERVONpZECOIPknK
        g/XB3+8Eo6/JmPYK/hxTTqkRbCty0UC+g1ybHnM=
X-Google-Smtp-Source: AGRyM1vctW2VpMiUwlqrtsJ6JupZvvJJF5fKR8mU5x4QDGGuaRpCqNxrxJovOpoHRixsCdd1Mx54mNwBtxoe4JdcD40=
X-Received: by 2002:a05:6122:2105:b0:374:3464:d057 with SMTP id
 k5-20020a056122210500b003743464d057mr7596355vkd.10.1657989637390; Sat, 16 Jul
 2022 09:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:11d0:b0:2d3:f3df:d0d2 with HTTP; Sat, 16 Jul 2022
 09:40:36 -0700 (PDT)
Reply-To: mrs.suzarawanmaling@gmail.com
From:   Mrs Suzara Maling Wan <wmrssuzara@gmail.com>
Date:   Sun, 17 Jul 2022 01:40:36 +0900
Message-ID: <CAE2wYjyyWrc_Bzrfif2iZ8eyZNA1JXJdXLXYSHh6z5D5skDfcg@mail.gmail.com>
Subject: hello!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a36 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5041]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [wmrssuzara[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I am Mrs Suzara from (Philippine) but based in West Africa Country
since eight years as a business woman dealing with gold exportation, I
have a dream and desire of building an orphanage home in your country,
and i have a deposit fund to the project, but presently my health
condition we not  allow me to carry out the project my self, now my
doctor has already told me that I have just few

period of time to leave because of my ovarian cancer disease, can you
help fulfill this project.

With kind Regards,
Thank you as i wait your reply.

Mrs Suzara Maling Wan

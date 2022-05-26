Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8D5535354
	for <lists+linux-hwmon@lfdr.de>; Thu, 26 May 2022 20:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236049AbiEZSbd (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 26 May 2022 14:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348494AbiEZSaM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 May 2022 14:30:12 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE35A4BFDA
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 11:30:11 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-e656032735so3233999fac.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=Z84Bdup9uZUJxpRHP9lbnlW7sGmbecjtWJ0xsbwiA4A=;
        b=E4MN8LUC+f20vRyy0wZf9slnvxuKxNv4XIPT1HO0N3EMYuCBfkSkSwZxh/393NXgfK
         PZaOOCPmh+UyTtF+9DcOWMFLDwTQAMvexWREbpLVZ4q0CLWse1ZrWbaO8eFgmAH4UoZ7
         ggJNRdqDsqJFBKrr9J0ZuNhOPA/3FQ8S/by4TMowSkgHLYDPiBq2mZ06rWke2jHtMRoo
         vhdNxYA6KIMXJnDD/BDighGjM64odT3yEi8UqnYhTUWIbxIgFP27uS+L0V+Eqb+llJJ5
         aleMHAlxByF1+CUXxCjDiCX46hB84U9s7kKjS7Gl3SKDXD1PMsvYHyHD3VlGBRWlGo13
         Cb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=Z84Bdup9uZUJxpRHP9lbnlW7sGmbecjtWJ0xsbwiA4A=;
        b=uf3yqr0z6VyRb/OB8ghgh1X7zZ37I9Jr+bgoBuhjo5EMWtG09Nk7BFMZuk2pnklP59
         9+yik7K6+0socs9apMvzKVlivDNCXCWcsociGId9U5YChIL6FKWYNtTAQt4lwAnxMFCH
         eQt53ph+S8EorGfPsePYRNZslBnYnGV+9KZzU+qZNZE184EA3xm6aYXjz49/c8ip6Onk
         grCtSMeKfu6yCZIoqFA6pf8rQb8OTyLAZOu60FEKXuREHS66iPUIPf2U2qc+6AsDK3X4
         Z/gqEg8ybs7Kvaz+VDCktZO64uS1RcRTex2qi9dPHNzEnVg28b5IqkFxri+S7h47D0bo
         Weyg==
X-Gm-Message-State: AOAM531vtmzFR1q6UAqj4Q+SSoKJGptmruf42ZpIZlOKJUUbvrlFdUqg
        +dBnnLgG+w4j2IJpwSmBEoxCtFA+iYaG3ZQGGaM=
X-Google-Smtp-Source: ABdhPJwGzXe/TXRRB03Ggn8wQELjVZeUQf+CG5ILo8YjpGuvE+APuQG4aQIiPzOkxZ+AWQqxV3KpT7FqBtsy2iaqs48=
X-Received: by 2002:a05:6870:e0d1:b0:f1:ad9a:8c98 with SMTP id
 a17-20020a056870e0d100b000f1ad9a8c98mr2035368oab.168.1653589810573; Thu, 26
 May 2022 11:30:10 -0700 (PDT)
MIME-Version: 1.0
Sender: eldristanko@gmail.com
Received: by 2002:a4a:3356:0:0:0:0:0 with HTTP; Thu, 26 May 2022 11:30:10
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Thu, 26 May 2022 20:30:10 +0200
X-Google-Sender-Auth: Io3rIrIy94_EUUTSC-NewPhPX5g
Message-ID: <CALry08VnT7ioqM4+wGGb0JNY7iRfwG8jVDCbbUHa=e2N+Rz2XQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,SUBJ_ATTENTION,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2e listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [eldristanko[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  1.7 MILLION_USD BODY: Talks about millions of dollars
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
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

I will make more details available to you on receipt of a positive
response from you

This transaction is risk-free; please urgently confirm your
willingness and interest to assist in this deal, I am in good faith
and with trust waiting for your Urgent respond and maximum cooperation
for more details.

Best Regards,
Mrs Aminata Zongo.

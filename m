Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6744EED10
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Apr 2022 14:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbiDAMYA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 1 Apr 2022 08:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbiDAMX7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Apr 2022 08:23:59 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE3327797A
        for <linux-hwmon@vger.kernel.org>; Fri,  1 Apr 2022 05:22:09 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id u207so2478166vsu.10
        for <linux-hwmon@vger.kernel.org>; Fri, 01 Apr 2022 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=ck4gQo2tB4+SPmewy2i1DH4nVbrN/pP6QkXZwEfzoWXAi+RASG8AxjqlsseWAqAso9
         NFAreDXDZEQLOFFt9rvMLtA+O5H/7DkrjOuIp+DHqwSBDKrixBJf6GUgCTHxyhkZe7nS
         v2bOyI3LpRiSa9QrMjtQ26HTH/kBM+LBZY4pWxHhCFXjn3bsSrmCrwnx0/iNtJqkGfni
         gC2lgKpo135ywoLBRFTwKOVDKMpOWOGE9t0reG5VBcheOoopMeV3mc1ndEjKWjY6uGLN
         eF6jjob6fgCBCG0JbrzOejp5JGF387HTyvi6tWr6GXgev0/SyyeTZP4sTNdUuIlIPrW7
         72PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=usCHcptdJPywXgKVKR/jIQrPYbFsErKqGEKJk/SVmUBG7+b2JJy0xyqwtOsIVqIOor
         h/ZKGAovMnb2KrhujMPpc/OYqUlgOIwsJmT2drZaQNc+OG0dK6muTRqn5imGm0DfjwuU
         KBtgsjDhXqj7xLbJLxfzvDbMgttGfl3Iqjn5NGVxQ1/IoeObhepdfTfmPbwrbqHMAdfq
         /ixbQP6pyNEdmVGw0wKxWXT725w0/JblUmgLCu+ZzB331qh8gksd5GhSzqVRsDJXfJ2F
         EeOXoZP9xQT3F5EM2GY0T1OsaKnR1vrxxeO9Jg6aDs6bDqtGd0LUXH9K2uHU+m6Lswfq
         0d1g==
X-Gm-Message-State: AOAM532K97fI8NvOiyDKdCvzYoYwoW3nqpIQBNgfX4PFWigkk3aNxo+S
        jWZTr6wLW6c6xJMqimR6Wo47IoyC2EHfgecZ2zs=
X-Google-Smtp-Source: ABdhPJx8FZTFf9x1W792KTCnIotqH68Kj2Ve3ZmaVmiVCvKALuPAa/xDTxHT8Hc+EIZSfKIdZjDBGMqov/imXm2ZQMY=
X-Received: by 2002:a05:6102:dc7:b0:325:9ab4:9722 with SMTP id
 e7-20020a0561020dc700b003259ab49722mr3649733vst.51.1648815728991; Fri, 01 Apr
 2022 05:22:08 -0700 (PDT)
MIME-Version: 1.0
Sender: westernuniontransferagenbf@gmail.com
Received: by 2002:a59:9008:0:b0:2a1:d34a:a722 with HTTP; Fri, 1 Apr 2022
 05:22:08 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Fri, 1 Apr 2022 14:22:08 +0200
X-Google-Sender-Auth: pOFY1SjBOBG82ey3I9XMp8_tllA
Message-ID: <CAOmRUUfVTEhQa9zSAgyGpKnfay0gM41Xk9rQff=x6oQZ234JMQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        T_US_DOLLARS_3,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5158]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsaminatazongo[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 T_US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        *  0.7 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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

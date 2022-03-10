Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07AB4D45BA
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Mar 2022 12:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241604AbiCJLfK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 10 Mar 2022 06:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239022AbiCJLfJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Mar 2022 06:35:09 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DB0F8BBD
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Mar 2022 03:34:09 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id bi12so11436517ejb.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Mar 2022 03:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=epzCD4K7PnDnVLzX+L/haVTGlvzMbgSlUckvHwpqyZ8AXdO8LyzmuRrWpT8MU8vd5u
         ryR7CngL2RG7E2TTuBYZcUpDHyHA2ocDJ5CIrXUTcTgOa8kOgzBaocjnNYuJ5UyHHDLu
         g3RTBwTbXzy9rj6At/yBwUsYIhCXhUdAhDuL3GeAbaoAqXfgle6sSwYDKK/Dlc0f9+Y1
         F3D7TXK1Q0+o0PN4omE8JXm4Ndl9GUkgp5dyrvc491INH+8fveSAVW5WfRdDr4R+Q9kF
         DtCejPjCpViZd0tm0v40109AseVF0KMKUsddA9mJHpMtDLBL27aEzlP2bWQ+ujLykIJP
         6IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=lf9V4sggXOLacXSP60+vmOr+TU15pbo0/YFwsNgP6ifXGNeEQBL/kBN7qdV+ULc1PT
         JlvG4q3ktQHWkwjZZeYTqTLNjEGUUr5FMKdSqZ5hRbAY5c+KFm0WCdgPxOKcmJw5PZZf
         4fA2zSnySTyiIZAKrNYZPGwpZVqs7KQ4Ctaw8wFUIOZc/83mmWMfLcRO7K//HV+b/Gul
         wNTCH9zJsahDOFNTFg/Yvi81aTHSUMyv2uoCrk1Pjjp0azS3lZwXr5lvJlGeO4X9EfgP
         0cdd4ZCEcY5zadbyOLsT2bGmIUmadDM6hI7dZIJ08K/iWfZMnbdntPhdsfPhHQu8T95N
         ltdQ==
X-Gm-Message-State: AOAM530SqbkHUVETlKRQBLwZj2JVeawD56NxzIP4xcWYoMQv9XiYP6Ej
        0GqNEgKhjhNd0qpwaloveaLyz3YIpiGZuesnP90=
X-Google-Smtp-Source: ABdhPJwLJqok7/HZufO/fgMnyqhFu3GEjqpZANPQJ0eTEQSoQJv9cMT+okARmwNcDAFoNV8CZOXvyX5OyhvwhJ8jnXw=
X-Received: by 2002:a17:906:32cf:b0:6d5:83bc:e962 with SMTP id
 k15-20020a17090632cf00b006d583bce962mr3925585ejk.108.1646912047553; Thu, 10
 Mar 2022 03:34:07 -0800 (PST)
MIME-Version: 1.0
Sender: aiish.affid@gmail.com
Received: by 2002:a17:906:1b15:0:0:0:0 with HTTP; Thu, 10 Mar 2022 03:34:06
 -0800 (PST)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Thu, 10 Mar 2022 12:34:06 +0100
X-Google-Sender-Auth: EW6z6v4DZbnXwinqqfKRaEwCTaA
Message-ID: <CAKfUuDtjGmkMfQaS5KbnCSP1XCnpHNeaT=qfUjb7C3c+a2YiNA@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_NAME_FM_MR_MRS,
        LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,SUBJ_ATTENTION,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5124]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsaminatazongo[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 HK_NAME_FM_MR_MRS No description available.
        *  0.4 SUBJ_ATTENTION ATTENTION in Subject
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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

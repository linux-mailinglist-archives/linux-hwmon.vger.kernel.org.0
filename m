Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838D3568F51
	for <lists+linux-hwmon@lfdr.de>; Wed,  6 Jul 2022 18:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbiGFQjS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 6 Jul 2022 12:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGFQjR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Jul 2022 12:39:17 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A65193E2
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Jul 2022 09:39:16 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id i11so19014002qtr.4
        for <linux-hwmon@vger.kernel.org>; Wed, 06 Jul 2022 09:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=osSAgKM1j6DRNQcQXA842NXUQk2GubTJs0svjrfNTko=;
        b=R+yDPLIBt1NcciTt1d1/o5iSW1PEZbw9xOI3GEC2xkIaXgvkYYLpPQKSCPcawqj2PO
         mii2BjJQ5bq0YVOw6weiRwsaZ9w3nDntjTkYPLjHpAcRtADDjvbLIkjpOVU7XD4QLfQf
         D6wGuwT3o0Nyw01tOtdiRj2sIUrUbCuEswcEcgZCDx3H6CdNU01WYMhj5UdVyJR7rXxU
         YWwQ8sbCjW0yAIT4eGQr1DALfPVmEvKw5LzjO39wiQX4NFig9YToEtYlYnBACcdGyE1D
         ZYAxilvG7gifK5ot5KD4ukpM92K+1nKly6cb/m5PvsGoC+ucYuaOmDihXXmjvybTOK1R
         QNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=osSAgKM1j6DRNQcQXA842NXUQk2GubTJs0svjrfNTko=;
        b=2GMSfPnSy2JR1n+NmqIdycoshJZtOgdGyPkuPRZ3sd+RWVaz2Cux7dduPWBLAU06cF
         5aBmZyxc3qxp9FAkQ6EX/KZaJKebtICDSGljzZDKlg/zDfHNMXaAMwiwPg6IOlrQaFzD
         JaCYxtG2iGb7H99Gk6sGhiLYM/sj5sf91CdMuo15yyAOyLspvt93eZa3gSVbVbpO/P7I
         I00d9XQPzhnpwChnKra6Z6J8IleBaPnoqSafYb0YQGHV9sivPnpuFsZtMJW8MS2PF2vQ
         +1SsupAm7PGE2ck1+UvdK7IYB+qifW6y3qUVxRhRcLAU8UQAM9Bwyf60iamany7PkgJ6
         G4Zg==
X-Gm-Message-State: AJIora/CXvaU2nLtcoAo39moP4zC7zD9Eo8R7kl+G729mzpEalt3bn5C
        VHWId4Z/GkZ4jUfetMA/CL/dKI65UZyuwdbrov4=
X-Google-Smtp-Source: AGRyM1vdkdqM7El+fqBLdqg64t2DXpGh6x2gONTys3Z7y24wCypka2P6AwURO++kyC43cbm/EqGqbTKxQgKPvKoB8ag=
X-Received: by 2002:ac8:7e8e:0:b0:31d:3d75:b623 with SMTP id
 w14-20020ac87e8e000000b0031d3d75b623mr19428689qtj.204.1657125555793; Wed, 06
 Jul 2022 09:39:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ad4:5bcd:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 09:39:15 -0700 (PDT)
Reply-To: michellegoodman035@gmail.com
From:   Michelle Goodman <michellegoodman001@gmail.com>
Date:   Wed, 6 Jul 2022 16:39:15 +0000
Message-ID: <CA+jr58qPHdj1QsrHconjCjntMu2UuLvr9EJVSkxPt68fpR8Ptg@mail.gmail.com>
Subject: =?UTF-8?B?RMOtay4=?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:833 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7750]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [michellegoodman001[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [michellegoodman001[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [michellegoodman035[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hallo, ich hoffe du hast meine Nachricht erhalten.
Ich brauche schnelle Antworten

Vielen Dank.
Michelle

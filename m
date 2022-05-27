Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC865535D85
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 May 2022 11:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349568AbiE0Jkv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 27 May 2022 05:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350650AbiE0Jku (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 May 2022 05:40:50 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C850F68B8
        for <linux-hwmon@vger.kernel.org>; Fri, 27 May 2022 02:40:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id m1so3695015plx.3
        for <linux-hwmon@vger.kernel.org>; Fri, 27 May 2022 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=u7Y/aNQfLOwE+LBFzRyrpOju2aGQFF727w+dXMJ2SrY=;
        b=I5XG+z6REwZB10h8Yyn/XrVydImCvIjgqW0MfTYEFxGLpjlwXJkZnwzuyJL9NHnbjA
         FbK1kBT/0ALSWPasFpYSoys243iB7ozA/zc6c6Eh6fllbvPBclSi/d79DILOmst11tWg
         ww5fVoO+dtcyUK9dF4O+mRwbB2kjsRiUI+GLiE4eOS39dSv5fh6/S/q+AfgHspyFgk/r
         XKYR5xmZzYHwu6MhHwEtim3DUsDQPuNQmMJEpsl5EwnEQExjAA8VYx0yq9oVhROsIh0u
         BgpZObC196P1NKJPPKqVAD5h1Khym4uFVFmqUxpOdBCEOttRvQvYIlPYf5JXxQehA7Kw
         l9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=u7Y/aNQfLOwE+LBFzRyrpOju2aGQFF727w+dXMJ2SrY=;
        b=mvaqkAvryQRJT4dompMVEk5x18iz2jyG95FH1PgHjoMW+WSwPbK0RmyFK65aKOdBsO
         c+V3t9sffhgaYFtpjYvCixNsJEJTwDasrcqzpqp6X4YNsAaIrj3ZARqJTQYLJctQj7F5
         wfzyy5qrB7dREnBtjoSPhb1RO2H6NLw2AhLj20XtO+KWOwMIrCP+uMHq1pWzv7jPEi8D
         fPryo70kUPZ2yvYgD3en/lMNtV0rAGNDxd0MoG7Vaagy3OEyVNWlZpx+bF6BSJoPWVsm
         LfhTo9HYD/zbzou2hxLK3Oci7XndL0pI/rcKCAYW+pzULhjnfhI78AbaBnlyh+c7zO9f
         yauQ==
X-Gm-Message-State: AOAM5335D4+Dl24UNBotUTMPYeTclz5dSG4nognmbuddEuzReThDBSdk
        EY33X3WBUag8Iyg47MGfCA6CpCy6xJY0COYrbhU=
X-Google-Smtp-Source: ABdhPJwI9pNTLEmFTFboD26f4DU/ZVvryC2IMup4/ymfqJEIEbzuddv2NV/DValhsYciivncRUuKMAZ4lxmYV1SnFIE=
X-Received: by 2002:a17:90a:6441:b0:1e0:b413:c290 with SMTP id
 y1-20020a17090a644100b001e0b413c290mr7378832pjm.179.1653644448732; Fri, 27
 May 2022 02:40:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:be1d:b0:82:5e75:b37c with HTTP; Fri, 27 May 2022
 02:40:48 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikram <kodjoadannou123@gmail.com>
Date:   Fri, 27 May 2022 09:40:48 +0000
Message-ID: <CAOtKoZ8ib2Ox6VUpKaj2_AymviLSPXUORonSM6QWZQVbxAycFA@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:634 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4976]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kodjoadannou123[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kodjoadannou123[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jub47823[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.

Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian

Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC57759127
	for <lists+linux-hwmon@lfdr.de>; Wed, 19 Jul 2023 11:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjGSJGr (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 19 Jul 2023 05:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjGSJGp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 05:06:45 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB0B2137
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 02:06:20 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55be1ce1669so4146930a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689757575; x=1692349575;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM7XUMAvmlk6h7cE3y+LS0P/v9AIDMPXrU5uC3Bfwzw=;
        b=Zun/KP5THTZx4SYYn9ES5e9AfydI84IHiJhuPrSZDHSMUJ/J8srKONCNtXReQbTOFb
         CQJYWcVboH3oFNdOQfJOC3CBNMX0VX1FsvkZTCfEvCvowDrbgJmB6x4fWxc+Re1LNKWh
         VeKa7V07/ib/RaEqWarsrRvzQ2a49roSOWlg1FYcRW7cmMJfsnStHIzYsRtXIxSmC/SA
         KAjVCPkt9ItU8XOvG1NgpoQFNBwTC8Vo3dckLQp4xOTeXvWJlDorqVftLkvbbDYTnmKl
         5X2FIkGBRLW0X7gXs2KKA2VSISV5vWFHO4zZ/QjY2cvmnoyTMhUhE1KxdmnkQGTpV5g0
         7Nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689757575; x=1692349575;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MM7XUMAvmlk6h7cE3y+LS0P/v9AIDMPXrU5uC3Bfwzw=;
        b=CXANQHXx34QCR3o8RgjIqUom4k3xiS96se5ou98wlw/vsanJd+kRjNzuTw13aG0jE9
         PjpzyAAxew661g465mdK3gguSrsMkXuL7nQP1VzkFGORZEMiFV/JaF9wLjm0Iq6ehTOn
         /4VRVgYcDQJh3UKC/gfBbaIrgF9WvyJXwpRndMkIx2ABPgak5StAMPTmhH8Rn7pHAOXo
         +JvvrZUFFGP7mB8Bz+zCPE4zj2OyaT9DOVlJoAQTnk9/4FNIiMRoqaAUEUOikx2gOMXH
         aNJMMWwUpvFfcmTYaxRetBNoQ+TWLv7WAWcWb5ZbRNanLbCRAYbFXUXV23SPygPKMrhO
         dbpg==
X-Gm-Message-State: ABy/qLb+DnNQWdCBVugaDn8N4sLzmRt1mwDzoCEObx5T7ELkCV+P/JDn
        ouS2q7OMbVfH2tvo5WZRnMuNCTFm6HuE+M14Rvg=
X-Google-Smtp-Source: APBJJlGFR9jCaNhbt2DBJLwoLFEyMuMye/hn1oMaW8hTRZTEYawh+R+RysEseIrhl9qZSyhHabsmS030fujxRNQdx4M=
X-Received: by 2002:a17:90a:e557:b0:263:e39d:a7e2 with SMTP id
 ei23-20020a17090ae55700b00263e39da7e2mr1398222pjb.4.1689757575331; Wed, 19
 Jul 2023 02:06:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e111:b0:4da:1abe:a260 with HTTP; Wed, 19 Jul 2023
 02:06:14 -0700 (PDT)
Reply-To: clementkwkhsbc@financier.com
From:   Clement Kwok <clementkwok998@gmail.com>
Date:   Wed, 19 Jul 2023 10:06:14 +0100
Message-ID: <CAArzz+H8Wem00c8s2eL5iUZSxdPTNTT6Tg_s5Mt9PqNp2fqR4g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,HK_RANDOM_REPLYTO,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:52e listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6567]
        *  1.0 HK_RANDOM_REPLYTO Reply-To username looks random
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [clementkwok998[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [clementkwok998[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Did you get the e-mail which i sent you last week? Please confirm and
give me feedback

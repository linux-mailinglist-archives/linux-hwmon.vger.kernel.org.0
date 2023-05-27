Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA3771356D
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 May 2023 17:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjE0PR1 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 27 May 2023 11:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjE0PR0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 May 2023 11:17:26 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F103E4
        for <linux-hwmon@vger.kernel.org>; Sat, 27 May 2023 08:17:23 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso330704166b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 27 May 2023 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685200642; x=1687792642;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=r1ySP9H/y/S5RVDDPGnl4JXAg0u4DE9eS67Be7TKyBm59N1K5baprrpUTXe5k64t0Z
         kBB8SI4iqVUbezn2ebm5SD7Yz8su+jG6BmYsNWt379VmuwnqA/fKiINNz2vSoqdIwtjK
         uj4KEfhV37JQd38f8R8ZQas0qKckeTGTp9yDFWqUcYdIYGvmFaKj8qf3fix4GCZVk4wT
         r/IBHR/K/nnWqOhS1XBMBppf4zA9erLkyrSt77Fe9FjRUi7hUbO+/LVgoupvaB0FlO9B
         yWiuAdNhwLTmWDro0do0ts+NIcRGpxhuv3nf0nwC8E3AwyfiOCglIMPXsMHNd5w4Ie6a
         2z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685200642; x=1687792642;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=Ul7s/mYRflwCj9WuEuYW73THGsnqp6MAS0tfupSu4Au7SyVt7NrIAgJtmUjPm5cmkG
         opPmk9ZWdSOeQRy7yolLajr24NBtawSkoG5emv51mBmJruBgrZbj2MPmd6w2AAra1WlN
         LEhut3Fsga8HkGa/Rme75r5/1UKR1Gi6bnPmo4S9l6aBWM6ecBT7nCqJlS7OU8WZxysU
         54AG7/DGBhOmGPtkpNbY5K15SoJMBrYzizQ38nWhjyJUlxhKV1uRZT/DZfp+e0bBBd2M
         lO8CDtitr6MyNNhPKQba09VshQapyRZzNDiIjQs2d/bAyqFmrbwxkQAZHz5/60IXnnKT
         vM+g==
X-Gm-Message-State: AC+VfDzx+yaNxEA/zwrNwLYtvqJOu64OslIkPuFg2TNVUDv4KudbpIAg
        fMnNLhG8jBWRpTQw9OXgVsSquz5SSbUF7vwb/Ss=
X-Google-Smtp-Source: ACHHUZ5Vx5rghte/wKVKNjbdXcbUfyCQq3dMtdVSH3QUTooI9DeMGmc4YZBtooxXjdkj+DRiIx7FpWJpnUDJJYzKHcA=
X-Received: by 2002:a17:907:94c1:b0:973:d857:9a33 with SMTP id
 dn1-20020a17090794c100b00973d8579a33mr3330136ejc.11.1685200641583; Sat, 27
 May 2023 08:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a98:d914:0:b0:1cb:cec0:ab8d with HTTP; Sat, 27 May 2023
 08:17:20 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <daswas250@gmail.com>
Date:   Sat, 27 May 2023 08:17:20 -0700
Message-ID: <CAM1W4N43-Cjm-u4s6x-b5ij3j3DabDWnsuUUvqPM8t94B8bojg@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:642 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4988]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [daswas250[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [daswas250[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava

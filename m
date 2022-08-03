Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F2F589283
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Aug 2022 20:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237566AbiHCS6v (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 3 Aug 2022 14:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiHCS6v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 Aug 2022 14:58:51 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303786561
        for <linux-hwmon@vger.kernel.org>; Wed,  3 Aug 2022 11:58:50 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id e15so17675197lfs.0
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Aug 2022 11:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc;
        bh=s8kzBR6yD3t8l+oWCIcSa7x4TVSX+N2XH3VFOQBZHG8=;
        b=agJwWzotke0VoAXYv2/dmdzDqMNt8NSBB8eknluo26LL93yjIF/AzWlFlq/1w4zewQ
         L1jU7qxIl7fMZknrFASSOvxS0Z2BhJU40MEC++F2GsCNTbBb9fgBnJUznikM6rNOw4SH
         EA6xHDor8upEgfxkI4O8GZ3j1znFuhG9RsWehAvWDrJCWRyIxztGg7CdoHuq8TCRAjwx
         +GhHVICKpXK8Z01RtoJ409Na5LZSoa+7I88ZR6eGL+1Z5xlpqQDzz39FZpQwRKLDjBfq
         gupwPHWNtan5v6t0VKhHfrm/XqRLzIMHzWsphhrn0DGvqQ34tfBK9111ggnZtlYQILbh
         AOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc;
        bh=s8kzBR6yD3t8l+oWCIcSa7x4TVSX+N2XH3VFOQBZHG8=;
        b=3WpWs+noVD6/1U8MiJBOaPmGCOUDxhPAW6xmG8iA7cetpyvi5/wA4CV8l/xkfQ9pde
         LXtFklrKGuwBr8/TmIS9m/Gg2Wvvlkk8LeZKIKurxU7r9ovkUVI7HBQr7akLtNnfOG5F
         bK3Cmeaolx9L57ZVdZIcThO3oev1hK6W12zx5F/53e3iDsq5qetm8BGGErVZEhrPV/bO
         PHtBrQZM/j9GzFb4OD190RIkwf4QXbPc92fK/KzgqoojsNgKLSi3DFudbzw5XRIHQpFm
         krYS6BofirZbdUTkB+m2LiEq0EulDg0gBUOUa8vt0DiEUeU6Hr2zsafH6RSHWczbeMwb
         fctA==
X-Gm-Message-State: ACgBeo2rORP9NgEBMCkqaR4/aA1sQUYo8B/qhrD0svVDLTpWFnAcH0rL
        52UfJW/5YW+JuuRc/x5BKvW2CE2cbsUb+VzyIIU=
X-Google-Smtp-Source: AA6agR5QDBuJGCETNSKpHTyhiSd1XL2t/mnj8D3IbmrnGbicjGtR1znn5ZlG/V7wIrOaVjAAtldhGkns4HHBoyVhKjE=
X-Received: by 2002:a19:6407:0:b0:48b:1959:8576 with SMTP id
 y7-20020a196407000000b0048b19598576mr1747683lfb.244.1659553128077; Wed, 03
 Aug 2022 11:58:48 -0700 (PDT)
MIME-Version: 1.0
Sender: richardharrisonn30@gmail.com
Received: by 2002:ac2:4f8b:0:0:0:0:0 with HTTP; Wed, 3 Aug 2022 11:58:47 -0700 (PDT)
From:   Sophia Erick <sdltdkggl3455@gmail.com>
Date:   Wed, 3 Aug 2022 20:58:47 +0200
X-Google-Sender-Auth: gSMCYLEbO-2ql6bKO-OI5GSFjHA
Message-ID: <CAPauVpuf7fd0QV6TVuKZDhYx38Mg+TLDvU3G0C-3pz9h3kz8Kw@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HK_RANDOM_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_MONEY_PERCENT,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:131 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6026]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  0.5 FROM_LOCAL_NOVOWEL From: localpart has series of non-vowel
        *      letters
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sdltdkggl3455[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [richardharrisonn30[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello ,

It is my pleasure to communicate with you, I know that this message
will be a surprise to you my name is Mrs. Sophia Erick, I am diagnosed
with ovarian cancer which my doctor have confirmed that I have only
some weeks to live so I have decided you handover the sum of( Eleven
Million Dollars) in my account to you for help of the orphanage homes
and the needy once

Please   kindly reply me here as soon as possible to enable me give
you more information but before handing over my details to you please
assure me that you will only take 30%  of the money and share the rest
to the poor orphanage home and the needy once, thank you am waiting to
hear from you

Mrs Sophia Erick.

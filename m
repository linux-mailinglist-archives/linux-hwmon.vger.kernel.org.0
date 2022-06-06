Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C362C53DF32
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jun 2022 03:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243404AbiFFBBw (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 5 Jun 2022 21:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235315AbiFFBBv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 21:01:51 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012533668E
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jun 2022 18:01:50 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id q11so2524930oih.10
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Jun 2022 18:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=LIYkXsh8NuZ+kWZJQV6Z3UgDflGRM7baotKUMbx/XVo=;
        b=FZBEUhwfUDy7El98duLevmUtdExYqFmO0w0ETeOI3TL+UCyXTcQrnebDlF2ON9iRl9
         7tXuZMb8b0H8wlaQO/AhTLhfbW68loGEKMtGWjktvkb7uw20OQ873CN3zbu47AnQ+kQ5
         oAve3GiBJypn2nmQiFHAv9ZJHKxetb+eGwNj+bMQRAawmslK6T8cGlyc8SA/CWP6uk1b
         ew5mkBAGx1EdwAUkPYB8JxHI+bYqiHCISGI3E32K1aP+gu8h4D0XuF+Y9GTOj/M2a3Eh
         XECAzd6IgpdBaqYsCxORjKmUZFBX3iVaSkrkLVPIP81nytL6XHXVX5jn7JpbaH/rPTvZ
         3JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=LIYkXsh8NuZ+kWZJQV6Z3UgDflGRM7baotKUMbx/XVo=;
        b=2R9svk+UxAGf/4GL0czoZ5l4770A9JheLFa99+7HDXc9Zqt8odKjMJtSFoc0NNm3Yq
         qjtnuYCBbdCVoQw17eMComlenvCfjDSBFjBRi/7N+ebLBnsmFjYulGP9proruCKz1p0p
         IS36KQHXUZpClmfk88fVMGBIe+A/njVUS11KaqOWDac0XSpel+m0IHKdtP4s1tCUhyOB
         ta3vGbBRoBOSbAt6YYOSyNoiUc2EnNRYll1tL+dKX35qzpeidYfHzQV6Niyvz9Q8hwsw
         GyLcSN3cWFxUM2/msRR7h9zE401xvVNQmux0LeW+iNeSg6dR8s18jRzcBB2Hct2HJgiG
         iqvQ==
X-Gm-Message-State: AOAM530QyraLTs6JDFQ68SxS/nQI5Blk6EbX4yum2+2YQGDVVOOgRp5S
        zrbrnY9Q43ouosezNUl3np78KL6b1q3aIP/6Wag=
X-Google-Smtp-Source: ABdhPJwd5WE4MpIsu3Y4+Fg86fCTKRqJKstdy5RR+U1xDX59TXSBIaK9N/ehp3n/3H00U71veaslYgOpd2ca6VxVEe4=
X-Received: by 2002:a05:6808:2010:b0:32b:17fa:a7e9 with SMTP id
 q16-20020a056808201000b0032b17faa7e9mr12297544oiw.173.1654477309300; Sun, 05
 Jun 2022 18:01:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3402:b0:a3:67f3:5d49 with HTTP; Sun, 5 Jun 2022
 18:01:48 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mr. KAbore Aouessian" <kiboraouessian@gmail.com>
Date:   Sun, 5 Jun 2022 18:01:48 -0700
Message-ID: <CALGXYcTDX_ZnM3pTt3+jOrj8vfRHND6P3=Ghh9OBB2B-3YXKjA@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Greetings,
I'm Mr. KAbore Aouessian, how are you doing hope you are in good
health, the Board irector try to reach you on phone several times
Meanwhile, your number was not connecting. before he ask me to send
you an email to hear from you if you are fine. hope to hear you are in
good Health.

Thanks,
Mr. KAbore Aouessian.

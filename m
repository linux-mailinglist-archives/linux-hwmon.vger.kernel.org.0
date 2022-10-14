Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67175FEE02
	for <lists+linux-hwmon@lfdr.de>; Fri, 14 Oct 2022 14:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiJNMgj (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 14 Oct 2022 08:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiJNMgi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Oct 2022 08:36:38 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404A1155DA7
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Oct 2022 05:36:37 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id ot12so10234994ejb.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Oct 2022 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N17Ap33yi3tDlWW24g5yIV6fT/20uv+lRdSqefJyZBE=;
        b=hbKeko8MI+KCkMPgYfQjwhttmWr59QrOw2Jun5dtnCl65HFnUChepj9Zrb8b+FyUeP
         6wy8vB8e1LyFw5guFw91XHz9b140QJ77fE8NO9henslPCEzNnGZ7SeflMnD0aMkmCZsM
         6r4NHcV+Zs5zx6pi87Nk4V/w40YUjHqLjjogHO/MTi5tOyZyGaLBq6WyFDkt59qhw/HL
         wTzgb+mCZEXvH7fSgI7J1T6dnzK+ENzEhfM/f4wn31GKdMu3euwiS5gCxWQxd0b9B11x
         4HhdJNZUkibg7Lf4KTn9kIyDVxFKekTtpwusEgFqTcBU55i85icNLyEFm/Koe0ZCRShw
         bGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N17Ap33yi3tDlWW24g5yIV6fT/20uv+lRdSqefJyZBE=;
        b=6x7L8N1jFXNpVAXTRjL2b2cfPanYrd8MGtCDGjW6ZNx29mQi0w+cUlGAvDbKo+F38M
         qcnDse2zR4eF/Lx0ngQ0l7smWFGLqEOf3fKpxKamLwVobVXr+nKS1zN3SROsHm4xSPt4
         F652/Y6kWl7cNutmqEBeXuSr79gye3TU/YcqF27oIEoURve+rVbYJLfJMfmau8psoJwo
         KLiaNRiJ3Apd9Ifc9kybXu6xohEjfvcM0PAv47B43rz++T9oYVJvqf1JYAVOSSKtrvPH
         O9JTb0JRgJtsIX6c+Mq97Gc1KKOXBoCE+9iP5cO2qnUL1sHU90JKfaXMHSkAZ3vFjA/N
         omzg==
X-Gm-Message-State: ACrzQf3Edq8cpG9wrQmsWOQQq9W8iCuwHNGwhG0OpXz5tg0bH8Cd7JUB
        PIbjArkMV974IEJ+Diy1HbkyK8WlI+TasegFRp4=
X-Google-Smtp-Source: AMsMyM4eY61JQjwDCPt5TAK09WhxXdM4ZYvjK1XgqsEbnWIfpsOc6j9VZmnb91xK5TYxr31OOXlTACKRNkN7+jd92g0=
X-Received: by 2002:a17:907:3205:b0:770:8554:c4ee with SMTP id
 xg5-20020a170907320500b007708554c4eemr3474551ejb.39.1665750995670; Fri, 14
 Oct 2022 05:36:35 -0700 (PDT)
MIME-Version: 1.0
Reply-To: luciadani18@gamil.com
Sender: hugoroger6@gmail.com
Received: by 2002:a50:3715:0:b0:1df:a555:bc4 with HTTP; Fri, 14 Oct 2022
 05:36:35 -0700 (PDT)
From:   "FORM MRS. LUCIA DANIEL" <luciadaniel001@gmail.com>
Date:   Fri, 14 Oct 2022 05:36:35 -0700
X-Google-Sender-Auth: zWXMvCrqOEXPnGMTAZjcxz_ZYgE
Message-ID: <CAGo+4SONV-G_kQ9TgaCRsaCv1WEhZupkwquoWQz997QRqp0CuQ@mail.gmail.com>
Subject: Hello Please I Soliciting For Your Assistance
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Proposal

Dear Email Owner Sir/Madam,

I am Sorry for emphasizing your email and your privacy here online
because we haven't met before,

My name is Madam Lucia Daniel,

How are you doing? If you have a minute I would like to discuss a
vital proposal with you for your kind consideration.

I have a fund worth =E2=82=AC8,500,000.00 million Euro. Belong to my late h=
usband.
I need the cooperation of your assistant to make the fund transfers to you.
I want you to present yourself as my trustee to receive the fund,
I want you to use this fund for charity, according to the wish of my
late husband and myself, to help disadvantaged people and orphanages.

I have my reason for making this decision.
If you are willing to help answer me.
Please contact me back at your earliest convenience.

Thank you and please stay safe.

With Warm Regards
Madam Lucia Daniel .

Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BACB14DA05D
	for <lists+linux-hwmon@lfdr.de>; Tue, 15 Mar 2022 17:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350191AbiCOQrV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 15 Mar 2022 12:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350202AbiCOQrU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Mar 2022 12:47:20 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DE8574BA
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Mar 2022 09:46:07 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id m84so2276557vke.1
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Mar 2022 09:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=UnoQ05qHPb9elCn+Cek1Evwb+Vo/Gq4dTqydXfDwikppLNizAFo8+nDbcuG0TfX2qd
         EZwUpIFiGznCBVYDzHYt00WPdRKViy97Rqf8gaOkh7JznL/Lsg63VZyR+F4KUX/t6agC
         Y0b99+STmLfg5KIHfAiA/TJMLR05gggByjX86NRXIy54ZA47qZNjKprizlZ7IIYIrV5A
         IQCW7Fu4BJUGrsfWei0G/SFE8L4SdBK73fOLDsR0q6bZcYODMJnsB1yUw0vhr/4WZvrB
         xYSwArVM8/LTUao+fwE3t9VvO7Yqu2dIEkltd7I8cqwJ1CICr0gI+tzT9vYS93Il2dcC
         BDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=utuMo5ZYEjDe+A6Aqk23VM1MCX1arQDGbUHstplLmaOe7s69OeuhEosYReQZ/fn/g1
         6oUq2uPVBqyJu8tTpG0a7MHOOUqoX02QLMvwRQcuGskYAlbT9zzC9G94DVN7cLx/F29B
         icdymwRxviLI/2TE6uZ0RHynFdQzQmS6pFlui6BZtwiNr3cX31FrDxssRyvpoPQbzzI2
         8qb/eZaupAKf3azLqF0ckHK/4mVxFTS7FaxyRt6DBF7q2dJBvFXfiayDntsI5AqfgAwm
         9N/M4b/D+JpH+tcbBrxU32IEATDXPkdWBPFwsTdEsiEvg6icaRAruaO0XhRDRjMEkrwr
         umYA==
X-Gm-Message-State: AOAM530w4ZXL24GlQguX8Z9AjXnyWKHfpu/oI46MhS6dWgFNQBFfidBD
        WX9DtGj5niBuIje3W+lBPhqyj2lnkERLUO02bGU=
X-Google-Smtp-Source: ABdhPJzpZFy23tmVKVOxFzzbLgOxtbNQwBb8gcEfmVBvGAe5Apyg/6MVXHsLyKRLrZ8nWHKtKsYzductAgydAwWqNZY=
X-Received: by 2002:a1f:3097:0:b0:336:da1b:7d9f with SMTP id
 w145-20020a1f3097000000b00336da1b7d9fmr11847671vkw.14.1647362766822; Tue, 15
 Mar 2022 09:46:06 -0700 (PDT)
MIME-Version: 1.0
Sender: vincentgeorgeag1@gmail.com
Received: by 2002:ab0:67cf:0:0:0:0:0 with HTTP; Tue, 15 Mar 2022 09:46:06
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Tue, 15 Mar 2022 17:46:06 +0100
X-Google-Sender-Auth: 6Lf6KAu2nHc1Xo54s1nM-y06i4k
Message-ID: <CAENe5cvicpXFhTkFJvNWtf3tm6XVEXE3J0w57VoceeTSsky8jg@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,SUBJ_ATTENTION,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
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

This transaction is risk-free; please urgently confirm your
willingness and interest to assist in this deal, I am in good faith
and with trust waiting for your Urgent respond and maximum cooperation
for more details.

Best Regards,
Mrs Aminata Zongo.

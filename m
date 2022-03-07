Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F754CFF03
	for <lists+linux-hwmon@lfdr.de>; Mon,  7 Mar 2022 13:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbiCGMoA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 7 Mar 2022 07:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbiCGMn7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Mar 2022 07:43:59 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5514F1BE80
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Mar 2022 04:43:05 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2dbfe58670cso162329777b3.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Mar 2022 04:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=S3JtR5HtN5TgHtZRkOpXh8ju3yrdK90cRx1M8SbEib4=;
        b=LhDON2UljQJe52q6F6S7H0TH7I/bO7UhbchLujvCcyR5hG4IZXEiS0xsggEthP+0Y+
         uDRR+acYHAU5Ha2rORf5mue53vRiW1q9ZvLfAPtPuM/zMLAStJlweLpGBrlC96FqcJGX
         t7b7j8RKg3HHVMfJ4Miq+TaX7RH/RzwBwNxo8o1RBmiGqgofrhuEvis4S8fwlS80wc74
         lmDTwe+xhZsPh92vnD2lPiiislsA5BAnhooiRw9DYKUY1dsfd5mU3M+nrauX54PRlZFW
         e9m457vF76Bs+tUzs3thrSlaa6s5dSqTBPNZAAhAOONZWWwkQdQsUsssiI+3pUpe0Z91
         Mfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=S3JtR5HtN5TgHtZRkOpXh8ju3yrdK90cRx1M8SbEib4=;
        b=qnj9kTXJQIaXgPWxsmT6Dy4DoZMRG29CDJm4WDmNXxjJsskC7IBZXNPQxjwtXdKoaW
         gcwno0KN7HNyAtDywdKENZpowiDgtS7d75U3h85Vd/7k56RSgLD7E97h+SSTU+zx5UOS
         PGfJ4ohsy961eAa7sB1sRxLvGVIT31CTNAXhKGsi4q18YMO9iIQqcklng5jtz/XagfHq
         YSU16V55EqVKEP67EBJnFOP4YH5PhQ/SakHPPqCCCR4T0mX1KLxtBCJt8f+Z8golgzZ9
         EDehhUlUilVTYzlRCPZWwWMy3X/Qi3FHbLrkG5pnP16gvXlzDH/Wvl9Xb3QAtjVZjomW
         Flmw==
X-Gm-Message-State: AOAM532oR0SlVUafHBYjsq/MOQz4SKrCnmyG0DzZpxnZY/auvQC5r/Eb
        dPFt5dBq9l0vH9A+7Z3dRiEC4f8ryoVPJ1m740w=
X-Google-Smtp-Source: ABdhPJxcOimZqQHhbPyvNbQPsc2puMHYt2N/1vRkw12mrIxI7kuBKL8tEmc0BzPdjSFIRhf1M0y+LSxoC6JHAfbleIw=
X-Received: by 2002:a0d:d8c8:0:b0:2dc:1491:d9e5 with SMTP id
 a191-20020a0dd8c8000000b002dc1491d9e5mr8212309ywe.273.1646656984629; Mon, 07
 Mar 2022 04:43:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7108:7048:0:0:0:0 with HTTP; Mon, 7 Mar 2022 04:43:04
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <arafaeloxford@gmail.com>
Date:   Mon, 7 Mar 2022 04:43:04 -0800
Message-ID: <CAM=40B+=-mx=uVd-dB1Vj=DdMLPvFVMzC-Wgcqv2A1zoKLvQxw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Please with honesty did you receive my message i send to you?

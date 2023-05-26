Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E9371252F
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 May 2023 13:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbjEZLDS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 26 May 2023 07:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjEZLDS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 May 2023 07:03:18 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191A2F7
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 04:03:17 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso146637a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685098995; x=1687690995;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+f0WP/+N5MvUYe92/BSqybSsARXcqQ8M6AlwJr5eQc=;
        b=VOW6tfQ+nmJecdrVIQQCA9q7EHq7pPG0Sn7Dthqg4zQArN4rkimdi0a4m1D4lQ2117
         agdFw46m1/mjK9owmC0VR/1SUjNGAV1xJ0HCmI3lQd6IhazaTJUUkABRh3+X2grBbvMn
         zn02L4WJJoKOYj2ZuzxG2m6HApoAFfi9Gb44uJYXj4keJG8N7W8ayWwtXOKGVDXZsSYw
         iZJxv5/LW69AfR2FW6Goqq5se3u+y5iazudOvggie6FhLTYXj2zM5HyW4Dr/Q2VNwvsb
         3N3847huTEOMBlzJDrUvboagFlCREqUU4D/zsZHkifl2fXV6D1dyPFnpcgjbEeV1d0Ci
         HQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685098995; x=1687690995;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+f0WP/+N5MvUYe92/BSqybSsARXcqQ8M6AlwJr5eQc=;
        b=BHSo2wPB5m/tt1GbETfaTXjqIvswIaYEFXTp0h5lUNUVnOdywcGw+TbT3+uMn6GGNf
         eMenzT7oSz+hziDFXF0slGcHabC9kD9yu9ppxXcqaXty5ddTbkKzU9yqL9+H75nTAEaN
         S3TF3g4mKtguMeJQRnEZL/1fvWeg0ywLmK9WN/Hwq/8OmL2KOecqu47KzrdxSigpmz1T
         LlUQRAQJ2aMsPLiUeAf4ZMqz1lopbciGtoe6ocfBVvNES1I5w3RYjInQ1eLBZYrjC0AX
         OX7tbyYp2G3/SkinipqRJsdcLaDRAt1IIhFnmUF3kxu3H0NahWmKvE+LwxW4GcKKf3Ro
         9NnQ==
X-Gm-Message-State: AC+VfDzPOnyZbHzzs9dPIRgtIvYChypmR6uBlC54UfQb3+2EHahFThrE
        A7q8/gONEBuNxZRoPepmlaGhGqv07rTi9+Xrf7E=
X-Google-Smtp-Source: ACHHUZ529TOEPIBB3RxnRXZQAwnrtcln8MgIwyTJE4mYuOfAG+D3jnZ6ftlmjcDXtu+ZBQh/Y1qtOKSSoAlavqCySpU=
X-Received: by 2002:a05:6402:7c5:b0:504:b177:3ef3 with SMTP id
 u5-20020a05640207c500b00504b1773ef3mr924479edy.3.1685098995598; Fri, 26 May
 2023 04:03:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a872:0:b0:215:8936:d3be with HTTP; Fri, 26 May 2023
 04:03:15 -0700 (PDT)
Reply-To: laurabr8@outlook.com
From:   Laura Brown <jeswa7m@gmail.com>
Date:   Fri, 26 May 2023 11:03:15 +0000
Message-ID: <CACGCBD42W5x3=xf_f_0oGJ7zMkaEum7UdVDUM9Xxouun6otyAQ@mail.gmail.com>
Subject: =?UTF-8?B?15nXldedINeY15XXkQ==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

15nXldedINeY15XXkQ0KDQrXkNeg15kg15zXldeo15Qg15HXqNeQ15XXnywg15nXpteo16rXmSDX
kNeZ16rXmiDXp9ep16gg15HXoNeV15LXoiDXnNei15nXlteR15XXnyDXlNen16jXnyDXlNee16DX
ldeXINep15wg15Mi16gg15HXqNeQ15XXnw0K16nXnCA4LjUg157Xmdec15nXldefINeT15XXnNeo
INep15nXldeX15bXqCDXnNeX16nXkdeV16DXmi4g15nXqteo15Qg157XlteQ16osINeR16LXoden
15Qg15bXlSDXkNeg15kg16jXldem15Qg16nXqtep15nXkdeVDQrXkdeh15XXk9eZ15XXqi4NCg0K
15zXldeo15Qg15HXqNeQ15XXnw0K

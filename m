Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC62583C83
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 Jul 2022 12:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236439AbiG1Kt6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 28 Jul 2022 06:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236260AbiG1Kt5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Jul 2022 06:49:57 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4413C1C123
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Jul 2022 03:49:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z25so2275780lfr.2
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Jul 2022 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vjovoCg99oJQSBv7Yy41PHx9jv3Xat4N5B+MMKdKhQg=;
        b=E9grpproY293z/xbUJfZUqtOihWkdkH1a6wDjnDSP8CLBb/baxYbqH8Ut4lpGmaZgI
         EXtXXHwnplM0AxTOwyYbhREIzVZ+dSlqaX9BtwQWAkerT1zAS1ybdx2ov6+thzVqcCKd
         Wz4osf62MoVx4nGRb5UGK/tOZkuF/lOvdCx03/p7ABJxP4iuR0v+Fb+Yi8gSaxAzBAr5
         E4k8tXaLmhuorTnJojSn/9SUPJ4eOi4f5xIbZNXETapQi7gudBgwsK7UcqrycKzmkEDi
         z0I+JPqwsaRb3+to3IVieyanQ8ReJbERKqpz9iyjpLdGRIWMjhdA7zFl3gYnCj6ivNun
         o79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vjovoCg99oJQSBv7Yy41PHx9jv3Xat4N5B+MMKdKhQg=;
        b=psQqyPKHQ0ake7E+W+gL4HORcg68grX3B5plmygcv3cGMtgd6Oekwfd7QEeq8aL5c6
         WZC271BDGBDtbOFgFPTJA3NUPTL7QG+ne4BY9Qr/l8M2TFUCeiedoP+j+EoyuBah0TGo
         tsQKyI/Fu8JvmFguPt8Dy+M91j2DKa9cRwNU31m6yKr5hwDoQB0IihNx3Yke1Lp/KbpS
         qS2mYAkVPvmnqtIESY8gBfUkLsk0yOcIINAQRkt5tg533eAb2qeJXT05uKfw8h2DyR9u
         T0lMhaE6mp2ysTzmPKU06n/BBbvbXMdqeOBw+F1ycrtyEdCSzuesoMxiwtgyGRU6pIeM
         AiVw==
X-Gm-Message-State: AJIora/wN+umXqP2pvI7qbCT77+SZYfFwTCIdSAYlhaAj1wLq9USKxB0
        dt+Ykc/xmNPWCHEOEH2nkkQOzOrgkZajQHycvA==
X-Google-Smtp-Source: AGRyM1t3F5bRcz9+i1t/0IbsV5MmOa9Sw5BoHK34LbDwlj6xWLUdZHsM4qQ5V2xlt4I9T2Fd3ZemiE41K/TBwng9OGc=
X-Received: by 2002:a05:6512:1690:b0:48a:c5b6:17cc with SMTP id
 bu16-20020a056512169000b0048ac5b617ccmr961487lfb.375.1659005393234; Thu, 28
 Jul 2022 03:49:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:68cc:0:b0:1d7:9e97:1618 with HTTP; Thu, 28 Jul 2022
 03:49:52 -0700 (PDT)
Reply-To: michellegoodman035@gmail.com
From:   Michelle Goodman <michellegoodman035@gmail.com>
Date:   Thu, 28 Jul 2022 10:49:52 +0000
Message-ID: <CAPJ5U1_D4YVFHJweALN2ww=6N3qgdGvyS2Y-W3jXh1EL+gUZ3w@mail.gmail.com>
Subject: Hola
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hallo, ich hoffe, Sie haben meine Nachricht erhalten.
Ich brauche schnelle Antworten

Vielen Dank.
Michelle

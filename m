Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCAA55073B
	for <lists+linux-hwmon@lfdr.de>; Sun, 19 Jun 2022 00:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiFRWLq (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 18 Jun 2022 18:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiFRWLo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Jun 2022 18:11:44 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203CAE018
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Jun 2022 15:11:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c2so11890623lfk.0
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Jun 2022 15:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=zHIL4aukfCQ/Ay1NRTaxjLdELuM0Pnhekk1kV+ATJNk=;
        b=ZTBl6E9KAZWEp87q5WuBiXHv1f313KlNPRM0lLt/zprwMS4DoTX+Ax+g1ZBvmn7/gH
         xRlYzXRJu8eUvacHtGBqarqYYQWKdp1AdrSKAdo6k+ZrnBhEQbq9QGRxTguf+4o6OQbP
         U+b1Ii1sai2nAc64Bpd5/WlzjWRG1vWO0EREcFge4eGCYjIVUXOG01nJ6sr8E17H+T8p
         XwvtNDfzx7WEkAzGDQQPUZTaQ0rXvM0S1k7QDcOIamm6/LKbMl9c8yjPHvHVHDEwFnQZ
         GDc6hdDs02ixa70pE3D6fpHlNTNtb1UljQfoqTWhxhOlrtjc9Ye/OSOgCY5eEEDeZx+e
         gE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=zHIL4aukfCQ/Ay1NRTaxjLdELuM0Pnhekk1kV+ATJNk=;
        b=p2553Vu92ka45Ou7Z3R1OxwsU0IxdMcubIMD7h5PAoezIBKIaf8g/teSZJ2XvqIG6D
         UWAkrfVygLvFVHq+oTBwAbds7iK55Ysl+hW+Nh+epNPQbsbVOEqYbsrIFYKxV9DkdHLD
         sKwxg2/14rQTX0/3BXK7GERuP/x06gFx9H+bHCK+tJ71yLseKnRCR0UJlzErMharp76x
         VyOSyVe3SVRWwaHdFLysp4uTjbjaXCtPzFWlKuMK4I+tENZ27STQWwiVaTARpuB8QVHJ
         4W9MIuirKHNsMu5ZHiE6lb/ebQ5zQ7dkDLOXfANtRncEc7kAGIEw45/Qz3ZcY3Yll+Cf
         pdnw==
X-Gm-Message-State: AJIora/Fdc9n+hcsnFSFByMJrXe7jJNdTd3G70lFw6/cDMjrVplVA/gM
        0X53noSL72HOGb3nCkc96laCC/UZOwrD/lCyWqw=
X-Google-Smtp-Source: AGRyM1vhOhQ9yukamq4V1PnDLXTTC4Z74zKCUGH2AOMQFCHPVQ3Zq5Fk00Yx3wGOtZUrUaf6K5/AjFv0WcZLYkbyz6Y=
X-Received: by 2002:a05:6512:3e0c:b0:479:1d59:3e52 with SMTP id
 i12-20020a0565123e0c00b004791d593e52mr9447310lfv.646.1655590301091; Sat, 18
 Jun 2022 15:11:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:30b0:0:0:0:0 with HTTP; Sat, 18 Jun 2022 15:11:40
 -0700 (PDT)
Reply-To: wlisa205@yahoo.com
From:   Lisa Williams <masaudunamalamai@gmail.com>
Date:   Sat, 18 Jun 2022 15:11:40 -0700
Message-ID: <CABC_ELC3rbrMiugSbxpTxfUEDCJ64L+Q7rB525CDpPDPi+Vz_g@mail.gmail.com>
Subject: Hello Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_60,DKIM_SIGNED,
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

Hi Dear,


It's my pleasure to contact you for a long term relationship.I was
just surfing through the Internet when I found your email address. I
want to make a new and special friend. Let's keep in touch and get to
know more about each other and see what happens in future.


My name is Lisa Williams,I am from the United States of America,I will
be glad to see your reply for us to get to know each other better and
exchange pictures and details about us.

Yours
Lisa

Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95A979E58C
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Sep 2023 13:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239827AbjIMLAI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 13 Sep 2023 07:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239847AbjIMLAH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Sep 2023 07:00:07 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6978419B0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Sep 2023 04:00:03 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5717f7b932aso4189839eaf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Sep 2023 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694602802; x=1695207602; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TEdx1B3/vE1SABfJd9OtBBbmrxl/YbyAk3pytLbX7k8=;
        b=rGVuud87tg2jnhRGOom8/7X4vz1qxtIYU/7c/2b5Cgg1e+xWYp3X9lqLKwmkIggtyh
         ALFu5dTzcRg2Yf1aFngmF2+Y7YZ3flMtnTX/UgULhXj2IsBHCqDPvD5V/frglKDO7tOl
         WFNInFVEe/n85TyQmCPUaNgDxbi+b31t+Dz4Tf2Sc7E6vNMD2quaV3MljR0oUo9FfG3V
         EzvBV+hfBns2hZEN5uVBkm9UFjFenNXBHIK+QFceXJCHXiR1ZrG2PrHoqkv+tRQ/qOpN
         jkm6uzQBZn0PuRP7p5a/ul3jX2NpTfaqbtaunW9Kdd8jPQyKQnUquTmG7o76h+9aoXKd
         c0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694602802; x=1695207602;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEdx1B3/vE1SABfJd9OtBBbmrxl/YbyAk3pytLbX7k8=;
        b=Cx0E93JTDNqKZ3MYxWBFNpowZ66n3ZO16SWCdAkxdS5beTljd5tYZGyJMsoBskWc/2
         iWzsvjJDD6sG5z+gO3GaCk+OQJYZECtijZjivXwzvrlYbEEwnrwsOLIRaebxGC2hzQyt
         Vmd9PZaUVL9j5fxx7E4KkPI0RrgOtHTPo6ZaEVOkwkOBzCESUZ5FDCYPV/msKufSfR+e
         nMHvFVwOsWQkulbwLfTOOIIN9FWaHJZbNvpCd01k25s+H8rWAb4JRJzNgjNoh8gm/3NY
         PSwS8DSnxJ29PpQV79kmJI2ViOdFWIZOEVwKN05J3SACouUGJ/VtaiW3LZoa8e0XcLMG
         YvaQ==
X-Gm-Message-State: AOJu0YymIiSbkCEv182vHyku26cxgTfA+hykY+qj3X1TFZIQZBLLgwKY
        p3aVvUW0gKXyJvCPuVQAkOJKq0n9+7nr4xsstDs=
X-Google-Smtp-Source: AGHT+IE3+lIAtOBgptAPQ5c1Z8EG/9Sepxc/Mh8JMVlX+8Z0XZuy0EVqsVgWb1WnEXm3OURfMx724os8MuPp10m+Z8I=
X-Received: by 2002:a05:6870:7394:b0:1b0:883e:3095 with SMTP id
 z20-20020a056870739400b001b0883e3095mr2206857oam.56.1694602802690; Wed, 13
 Sep 2023 04:00:02 -0700 (PDT)
MIME-Version: 1.0
Sender: yvonnebalakiwal1@gmail.com
Received: by 2002:a05:6838:a613:b0:79a:f668:d6ba with HTTP; Wed, 13 Sep 2023
 04:00:02 -0700 (PDT)
From:   Mrs Evelyn Richardson <evelynrichards10@gmail.com>
Date:   Wed, 13 Sep 2023 04:00:02 -0700
X-Google-Sender-Auth: _ieN_OEK1AUMgTGD9OfBXpWvlkc
Message-ID: <CAFT-94dELAPA5xdp-ifCRpg1SiWK=_EBizBQ3uvUKhvv9zEkaA@mail.gmail.com>
Subject: Dear Beneficiary
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear Beneficiary.
 This is to inform you that the United Nation Organization in
Con junction with the World Bank has released the 2023 compensation
Fund which you are one of the lucky 40 winners that the committee has
Resolved to compensate with the sum of   Twenty Seven Million Five
Hundred Thousand United State Dollar ($27.500.000.00) after the 2023
General online compensation raffle draw
Held last WEEK during the UNCC conference this year with
The Secretary-General of the United Nations Mr. Ant=C3=B3nio Guterres in
Geneva Switzerland. This payment program is aimed at charities / fraud
Victims and their development to help individuals to establish their
Own private business/companies.
Your E-mail was randomly selected among others to receive this Fund
Through our International Micro Soft Network during the compensation
Ballot survey/draws.
Therefore, contact Engineer Account Mrs Kristalina Georgieva, he is
our representative and also United Nation`s Coordinator in United
State of America that will organize with you in Dispatch or handling
Your DISCOVER CARD to your Destination. You are to make sure that you
Received the UN Approved DISCOVER CARD in your names which is in list
Founds in names of U.N world list to receive this UN Guest Compensation.
We are at your service.
Mrs. Evelyn Richardson
Directorate for International Payments
United States of America USA

Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD8C1BE71E
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2020 21:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgD2TQe (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 29 Apr 2020 15:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2TQe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Apr 2020 15:16:34 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2222C035493
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2020 12:16:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x25so3307662wmc.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2020 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=uTaxYC0jwA+3Mf6QeyL0kxKKg+CdYcd/49GGY7p9esY=;
        b=fvrS0VEE66iO7kf6DfmoKB0rXIEmgiuWit2Fu+SmZkTgV6Cz07n/xX2l0Biwa1hAvY
         1rEHDzYF+Wb6TaiiZhFSD0G25jsO/9oCpN6WJ4Ofic0d8qZck24SS0b83d80Q2n9lC+3
         vjSpHa8acnnKltv95KH9GXphftHAkW4OfVrBeuHMhJsh5bL/o9sEXRrcQ4PmoeoTOuxh
         oaZK3GiZEZ4cHhxuzNnpKkAiHeBNLqjCNqWK4u0sg/S2vdTywv30jYvWIP2vHJQZCUTv
         NXkpzzCTNxpxeraY4yOZeKvak+SgmC9CpSWq/NTkuLEhMo09VG1wovwqUeGDWA+/+8Nj
         MxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=uTaxYC0jwA+3Mf6QeyL0kxKKg+CdYcd/49GGY7p9esY=;
        b=qjvfy8L+1KbGb8ArIFXZbsclCzd53lr9fUmEfvFNZm0rXlt7wHgfpDC6TxG+HzzTjh
         LhbDpHN/rc5f+EA7H3W++oe87DPD1LqakB/1hdwfYGZd61vH/W3yhEcyeYZo0McbsFyd
         BTINen+qGPHR7fDUQAaB8yoOncbfE8EC5rj3BlSy4H7ZlrYH7MV2RWyZ7kD6CFCQfkPg
         kcqKqbEGY8CJTE71IYGeeyQe2qnDJx+rR7EKRdxrNweRyFgJNj06i4VTP84lCxdYz8ns
         DXBulcwtuoDUkwxvWNI5tthRc+fE2kTNOA1CivUuJXpBD4yZrzMIbs/toFycepgkovXw
         /1lg==
X-Gm-Message-State: AGi0PuYK2jCjU+YFk7LVLjcAaQxVSPUaq5erdYKAL3mfYUK3J01i+0O/
        MblbtBhKDlaWi6kqHG14fnD51RxTU7jlXg==
X-Google-Smtp-Source: APiQypLJ0zeDoIhCzi097XAozrXJsq0a0rW6Z3NDWwTzdI9ZLjqD2jG0z5naNye1gwdLaN6JoAuAiA==
X-Received: by 2002:a1c:2e07:: with SMTP id u7mr4865638wmu.74.1588187792498;
        Wed, 29 Apr 2020 12:16:32 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id e5sm235982wru.92.2020.04.29.12.16.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 12:16:31 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, lee.jones@linaro.org,
        jdelvare@suse.com, linux@roeck-us.net,
        srinivas.kandagatla@linaro.org
Cc:     nick@khadas.com, art@khadas.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/8] mfd: Add support for Khadas Microcontroller
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
Date:   Wed, 29 Apr 2020 12:16:28 -0700
Message-ID: <7h4kt2ksqb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The new Khadas VIM2, VIM3 and Edge boards embeds an on-board microcontroller
> connected via I2C.
>
> This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
> boards.
>
> It has multiple boot control features like password check, power-on
> options, power-off control and system FAN control on recent boards.
>
> Thie serie adds :
> - the bindings
> - the MFD driver
> - the HWMON cell driver
> - the NVMEM cell driver
> - updates MAINTAINERS
> - add support into the Khadas VIM3/VIM3L DT
>
> Neil Armstrong (8):
>   dt-bindings: mfd: add Khadas Microcontroller bindings
>   mfd: add support for the Khadas System control Microcontroller
>   hwmon: add support for the MCU controlled FAN on Khadas boards
>   nvmem: add support for the Khadas MCU Programmable User Memory
>   MAINTAINERS: add myself as maintainer for Khadas MCU drivers
>   arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
>   arm64: dts: meson-sm1: add cpu thermal nodes

These two could/should be sent separately from this RFC series and
queued for v5.8.

Kevin

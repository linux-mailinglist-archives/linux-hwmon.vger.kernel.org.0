Return-Path: <linux-hwmon+bounces-410-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFED80AC7F
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 Dec 2023 19:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89670B20A79
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 Dec 2023 18:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644DD39859;
	Fri,  8 Dec 2023 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzDdg+Mz"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A573311F;
	Fri,  8 Dec 2023 10:51:49 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b9d009df75so1588091b6e.2;
        Fri, 08 Dec 2023 10:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702061509; x=1702666309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ieFZeZExPDcfXFMJbRJRIPdIbTbxquR6KmBlG8/ou+Q=;
        b=OzDdg+MzAYv15/Ej8QBVhh0xvsAIvEuethS9zUOPOxnj0EB/XfZ40kQyA0wFZ1lYvk
         9xbbKg8oAMvXEf7CUln/vKLG+i+0vbq9bQiOxL0+AGPEzAGIDjBkb8NTPdihn8bTraDv
         0gMWTBJyIwx1oXHtAPGIP5taGXXEuVfSqFNAdEy/RA4Pkmn6P1+Qw/33Qcr+iva2Vlxq
         +8Qf0n6AHZFZ6htZ5dlDKICdiCWXeKNYWrWXmjgiH/rKFQLrwgexTmcC/ZNJnX3rXq/P
         g8ICQERSf5MIYobxkGMuEdWS0x5VCUfI8cw/jWOpqlqG5as4qy/xFEebuaIbWK88bB/F
         58lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702061509; x=1702666309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieFZeZExPDcfXFMJbRJRIPdIbTbxquR6KmBlG8/ou+Q=;
        b=d8S+yu0M417ZOO4MXF3Jkpk6LqDgZeqTbgs5EOPGzaxhRJmz7WE5pVic+x8pcfwL8E
         Ro4VnFf2xEUe+9C3Gpir9FN3ohNcAwOHAR7HMOieLgniEYydqPt3EVSXawC6FOlCWNYA
         IyGj2xomiqjQQdU1YGrg4bYKZa/+3I13IT+UUZv7jC7nc+uR78GHd8NKdaVZhg7qXfvI
         jDdosHuwRTmeE6r0puvuGe0fe1k8kt1C4z8w8DxFHqJGKFlpIa39Cksbk6RdRIbVLhMl
         kcm1/+B3koxyEs7ckSHvKG1+Op1yvs1/DBMXr7cC3U19N4xpBZDmUJq553s2NLrYMDXs
         hCTg==
X-Gm-Message-State: AOJu0YzcUHnmr+jCvKAzA98P5z5gOgT+MaOfewkSYmBFyOtWqggFWZ37
	k0BEw0useZBsdSzKxrmrpKNaGU7M/7M=
X-Google-Smtp-Source: AGHT+IFDLuyCuc8MXVBGyZcDDvIqIqC3jiD5KeDHUih2iLwZA4DR5SrypJmTIuIzhll2O2mXF7uzqg==
X-Received: by 2002:a05:6808:bcf:b0:3b9:f1f4:ab5e with SMTP id o15-20020a0568080bcf00b003b9f1f4ab5emr594856oik.59.1702061508965;
        Fri, 08 Dec 2023 10:51:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i26-20020a54409a000000b003b2e2d134a5sm427136oii.35.2023.12.08.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:51:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.7-rc5
Date: Fri,  8 Dec 2023 10:51:47 -0800
Message-Id: <20231208185147.1252216-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.7-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.7-rc5

Thanks,
Guenter
------

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.7-rc5

for you to fetch changes up to 307004e8b254ad28e150b63f299ab9caa4bc7c3e:

  hwmon: (corsair-psu) Fix probe when built-in (2023-12-08 10:36:02 -0800)

----------------------------------------------------------------
hwmon fixes for v6.7-rc5

- acpi_power_meter: Fix 4.29 MW output sen if acpi reports bad data

- corsair-psu: Fix ability to probe if the driver is built into the kernel

- ltc2991: Fix spelling mistake "contiuous" -> "continuous"

- max31827: Add missing regulator header file include

- nzxt-kraken2: Fix error handling path in probe function

----------------------------------------------------------------
Antoniu Miclaus (1):
      hwmon: max31827: include regulator header

Armin Wolf (2):
      hwmon: (acpi_power_meter) Fix 4.29 MW bug
      hwmon: (corsair-psu) Fix probe when built-in

Christophe JAILLET (1):
      hwmon: (nzxt-kraken2) Fix error handling path in kraken2_probe()

Colin Ian King (1):
      hwmon: ltc2991: Fix spelling mistake "contiuous" -> "continuous"

 drivers/hwmon/acpi_power_meter.c |  4 ++++
 drivers/hwmon/corsair-psu.c      | 18 +++++++++++++++++-
 drivers/hwmon/ltc2991.c          |  2 +-
 drivers/hwmon/max31827.c         |  1 +
 drivers/hwmon/nzxt-kraken2.c     |  4 ++--
 5 files changed, 25 insertions(+), 4 deletions(-)


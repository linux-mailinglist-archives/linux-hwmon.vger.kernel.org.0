Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79B11B2082
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Apr 2020 09:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUH7V (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 21 Apr 2020 03:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDUH7V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Apr 2020 03:59:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D82C061A10
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 00:59:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t14so15281058wrw.12
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KBv83Opptndn2jdIJyA6t7FILIlZmdOYex4CsUwqmNQ=;
        b=hS+LRixnfkLjE0FsbJeMvANZLtZZuyLjepxHDIzVFV8ezKMcNoIObspGNYAhNlczud
         FadL6xHproBrIigBYr/aCSt3LF0NEW+W/PRVZtka7Yd0jJkYrZdgarrSveUsj52kQ1G7
         g7YlC9MVpU7rA2SZ67z4ldYrRFSIF90A3RsVaajgN267yEmjAW9lWVcL8/8Oux1ooEU4
         0CEi2oUYhUUMNNbPfbgWdEaC3VNqSlc/pieqUuXI6LdqK9SXaNhPeDzG330JgO6hV3e+
         7hGNgukrfxloz+KJVyiaeNgqSlBeveB09QAZ9HI8mIffHO97g6mod2ls4G9OAWWjX33M
         D2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KBv83Opptndn2jdIJyA6t7FILIlZmdOYex4CsUwqmNQ=;
        b=CAxezW0WpD7CHHR4XtqPnhnb7OzhExpaK36KW+LpY+iAmkxnTSJH51b+EMlL5D/BRe
         mhOzlXNSEcdxGBIzmT+dncMWsbYw7jfgWdloDrU+8cTODSvolzNresgbl4Kxk+wZQb3Y
         bvVRrx3HtGDngtvVTtSSTVv9ougf2FqWDRh/jI11CpXLEll2yeaOAR8+ixBlrXl+wtRj
         ChvCoNPhVqag4dfYSo3RPoK+s0o5UZGKXHtoBNYh6Pdkh1SQ0o+dModSAzCAx8N06qCf
         rH8GNNukVEq/rS0Oq+di/UH2JPj0uxof5qnz259POZaaOlDunfFxg4FjMjUS4ko3X/ix
         oY2A==
X-Gm-Message-State: AGi0PuZDrFRB4+zeP774avItP2/8LPcsZ4WbnEPVlz7g71b+/dI8IRNK
        iQgKbRo1KdoB36xd3OOUdpgn6g==
X-Google-Smtp-Source: APiQypJb/6u9KnSAb8SAnrnhcFpGvJnOSKuw4PDGmIILpnu5gtmeBHLlpeYuPK3Lt+4+SmjuGQgHzA==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr18526546wrn.108.1587455959263;
        Tue, 21 Apr 2020 00:59:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id h6sm2484112wmf.31.2020.04.21.00.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 00:59:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     lee.jones@linaro.org, jdelvare@suse.com, linux@roeck-us.net,
        srinivas.kandagatla@linaro.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC 0/8] mfd: Add support for Khadas Microcontroller
Date:   Tue, 21 Apr 2020 09:59:07 +0200
Message-Id: <20200421075915.22577-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The new Khadas VIM2, VIM3 and Edge boards embeds an on-board microcontroller
connected via I2C.

This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
boards.

It has multiple boot control features like password check, power-on
options, power-off control and system FAN control on recent boards.

Thie serie adds :
- the bindings
- the MFD driver
- the HWMON cell driver
- the NVMEM cell driver
- updates MAINTAINERS
- add support into the Khadas VIM3/VIM3L DT

Neil Armstrong (8):
  dt-bindings: mfd: add Khadas Microcontroller bindings
  mfd: add support for the Khadas System control Microcontroller
  hwmon: add support for the MCU controlled FAN on Khadas boards
  nvmem: add support for the Khadas MCU Programmable User Memory
  MAINTAINERS: add myself as maintainer for Khadas MCU drivers
  arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
  arm64: dts: meson-sm1: add cpu thermal nodes
  arm64: dts: meson-khadas-vim3: add Khadas MCU nodes

 .../devicetree/bindings/mfd/khadas,mcu.yaml   |  44 ++++
 MAINTAINERS                                   |  11 +
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi    |  23 --
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  22 ++
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  23 ++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  24 ++
 drivers/hwmon/Kconfig                         |   9 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/khadas-mcu-fan.c                | 230 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/khadas-mcu.c                      | 143 +++++++++++
 drivers/nvmem/Kconfig                         |   8 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/khadas-mcu-user-mem.c           | 128 ++++++++++
 include/linux/mfd/khadas-mcu.h                |  91 +++++++
 16 files changed, 751 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
 create mode 100644 drivers/hwmon/khadas-mcu-fan.c
 create mode 100644 drivers/mfd/khadas-mcu.c
 create mode 100644 drivers/nvmem/khadas-mcu-user-mem.c
 create mode 100644 include/linux/mfd/khadas-mcu.h

-- 
2.22.0


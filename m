Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3E550F211
	for <lists+linux-hwmon@lfdr.de>; Tue, 26 Apr 2022 09:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343808AbiDZHWL (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 26 Apr 2022 03:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbiDZHWL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 03:22:11 -0400
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030DA9AE41;
        Tue, 26 Apr 2022 00:19:03 -0700 (PDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net [174.21.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D80B0171;
        Tue, 26 Apr 2022 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1650957543;
        bh=1OucBjH9mVAJhlq6zsi21AQDnwQp9EQJmkyjJblzrxk=;
        h=From:To:Cc:Subject:Date:From;
        b=V2oF6d7UsWxhRcG3OfTt8zoOtQ6IOyoRQr265WdaWXpCSNtfNyBq/ONiU5TuQW6xu
         elX46km3KlQK9H2Cf3VJui+H1V5X0wEMRh53Cqk3IX8QTwkeuPeBZ44BGmi7uNEGLB
         eqWl7+N9Fqf3i0O2mkwx6UEv/ED10NZ3nWah4Nck=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] hwmon: (nct6775) Convert to regmap, add i2c support
Date:   Tue, 26 Apr 2022 00:18:42 -0700
Message-Id: <20220426071848.11619-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

This is v3 of my effort to add i2c support to the nct6775 hwmon
driver.

Changes since v2 [0]:
 - Fixed wrong parenthesization in nct6775_write_value()
 - Moved DT binding to trivial-devices.yml instead of a dedicated file
   [Guenter]
 - Renamed drivers and Kconfig symbols to keep existing platform
   driver as "nct6775" (SENSORS_NCT6775) and the core module as
   "nct6775-core" (SENSORS_NCT6775_CORE) [Guenter]
 - Fixed SENSORS_NCT6775_CORE Kconfig to select REGMAP, removed
   erroneous REGMAP_I2C selection from SENSORS_NCT6775_I2C [Guenter]

Changes since v1 [1]:
 - Added preparatory patch converting driver to regmap API [Guenter]
 - Replaced ENOSPC with ENOBUFS and removed WARN_ON() in
   nct6775_add_attr_group() [Guenter]
 - Added dedicated symbol namespace [Guenter]
 - Removed nct6775_write_temp() and nct6775_update_device() symbol
   exports [Guenter]
 - Reordered patches to put dt-bindings patch first [Krzysztof]

[0] https://lore.kernel.org/linux-hwmon/20220309005047.5107-1-zev@bewilderbeest.net/
[1] https://lore.kernel.org/linux-hwmon/20220226133047.6226-1-zev@bewilderbeest.net/

A slightly edited version of the previous cover letter follows:


This patch series augments the existing nct6775 driver with support
for the hardware's i2c interface; along the way it converts the driver
to use the regmap API, and splits the LPC-specific platform driver
into a separate module from the interface-independent core.

Thus far the nct6775 driver has only supported the LPC interface,
which is the main interface by which the Super-I/O chip is typically
connected to the host (x86) processor.

However, these chips also provide an i2c interface, which can provide
a way for a BMC to also monitor sensor readings from them.  On some
systems (such as the ASRock Rack ROMED8HM3 and X570-D4U) this may be
the only way for the BMC to monitor host CPU temperatures (e.g. to
indirectly access a TSI interface); this functionality is thus an
important component of enabling OpenBMC to support such systems.

In such an arrangement the Super-I/O chip is simultaneously controlled
by two independent processors (the host and the BMC) which typically
do not coordinate their accesses with each other.  In order to avoid
conflicts between the two, the i2c driver avoids all writes to the
device, since the BMC's needs with the hardware are merely that it be
able to retrieve sensor readings.  This allows the host processor to
remain ultimately in control of the chip and unaware of the BMC's use
of it at all.

The sole exception to the "no writes" rule for the i2c driver is for
the bank-select register -- while I haven't been able to find any
explicit statement in the Nuvoton datasheets guaranteeing this,
testing via manual register accesses (as detailed in [2]) has
indicated that, as one might hope, the i2c interface has its own
bank-select register independent of the one used by the LPC interface.

In terms of code structure, the approach taken in this series is to
first convert the driver's register accesses to the regmap API, and
then split the LPC-specific parts of it out into a separate module
(retaining the current "nct6775" name), leaving the
interface-independent parts in a generic driver (called nct6775-core).
The nct6775-i2c driver is then added as an additional consumer of the
nct6775-core module's functionality (essentially just providing its
own set of regmap read/write callback functions).

The first patch adds the chips supported by the nct6775 driver to
Documentation/device-tree-bindings/trivial-devices.yml.  The second
patch contains the change to convert all register accesses to use a
regmap.  The third and fourth patches make some relatively small
infrastructural changes to the driver.  The core/platform driver split
is in the fifth patch, and the final patch adds the i2c driver itself.

The nct6775 and nct6775-i2c drivers have both been tested on the
NCT6779D in an ASRock ROMED8HM3 system and the NCT6798 [3] in an
ASRock X570-D4U (the latter thanks to Renze, CCed); both seem to work
as expected on both systems.  I don't have access to any asuswmi
hardware, so testing of the nct6775-platform driver on that to ensure
it doesn't break there would be appreciated (Oleksandr, perhaps?).


Thanks,
Zev

[2] https://lore.kernel.org/linux-hwmon/YhttzgDtGpcTniyw@hatter.bewilderbeest.net/
[3] Though it's physically labeled (mislabeled?) as an NCT6796, for
    what that's worth.

Zev Weiss (6):
  dt-bindings: trivial-devices: Add Nuvoton Super I/O chips
  hwmon: (nct6775) Convert register access to regmap API
  hwmon: (nct6775) Rearrange attr-group initialization
  hwmon: (nct6775) Add read-only mode
  hwmon: (nct6775) Split core and platform driver
  hwmon: (nct6775) Add i2c driver

 .../devicetree/bindings/trivial-devices.yaml  |   14 +
 MAINTAINERS                                   |   10 +-
 drivers/hwmon/Kconfig                         |   30 +-
 drivers/hwmon/Makefile                        |    2 +
 drivers/hwmon/{nct6775.c => nct6775-core.c}   | 2310 +++-----
 drivers/hwmon/nct6775-core.h                  |  252 +
 drivers/hwmon/nct6775-i2c.c                   |  179 +
 drivers/hwmon/nct6775.c                       | 4652 ++---------------
 8 files changed, 1410 insertions(+), 6039 deletions(-)
 copy drivers/hwmon/{nct6775.c => nct6775-core.c} (69%)
 create mode 100644 drivers/hwmon/nct6775-core.h
 create mode 100644 drivers/hwmon/nct6775-i2c.c

-- 
2.36.0


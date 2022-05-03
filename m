Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C127518283
	for <lists+linux-hwmon@lfdr.de>; Tue,  3 May 2022 12:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234300AbiECKuv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 3 May 2022 06:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbiECKug (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 May 2022 06:50:36 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463282C66F
        for <linux-hwmon@vger.kernel.org>; Tue,  3 May 2022 03:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651574801;
  x=1683110801;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o/eCS27yahlByDvSaZssRezknZpsZ6YRk5/drh0zk5Y=;
  b=Q3SSQDnRPMH5XbXSM8lJJo0F83bH+pZWpiAy2BMl2CcBlx5H02MlskRE
   BEKvFzIU0XavxagDA9lo3sSGQENBKdUuH0xP0SH5O4JsmzrZkNn6SWcto
   wgN/qwXyZvh3Qj1LdT5gu50Q6KSa8i5si7ZzUq6yVlbrSAHBWOedZtc3y
   PcCQiMSJlrBsvV5RfhGx9I/BgEoFa7YTovxJKYS9Jbi9rJNuet16PauOi
   Kqi1aHiW3x9i/43il9jY3Mq23EAtUrEmEj0hugrMGTkXturK0qET4hT+3
   nEVDVYXmoMFjt81qVFGEh6VLGi8RHxviyUK+A/VdUL62S4IQ8xFRfSkCZ
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v6 0/4] hwmon: (pmbus/ltc2978) Add regulator ops
Date:   Tue, 3 May 2022 12:46:27 +0200
Message-ID: <20220503104631.3515715-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi!

The LTC2978 driver supports a wide range of power regulator chips, but it
has limited functionality for using it in a dynamic regulator framework.
Since standard functions for setting and getting voltage are missing as
pmbus core operations this patchset adds it.

These patches have been tested on an ARTPEC-8 developer board with a group
of LTC2977 power regulators.

Kind regards
Mårten Lindahl

Changes in v2:
 - Add pmbus core _pmbus_write_byte_data to check for driver specific callback
 - Change pmbus_update_byte_data to use _pmbus_read/write_byte_data
 - Change pmbus_regulator_is_enabled to use _pmbus_read_byte_data
 - Export pmbus core functions enable/disable/is_enabled

Changes in v3:
 - Split patch "hwmon: (pmbus/ltc2978) Use driver specific ops if they exist"
   into two patches: (1) pmbus core, (2) ltc2978.
 - Move ltc2978_regulator_get/set_voltage functions to pmbus core.

Changes in v4:
 - Split (and rename) patch "hwmon: (pmbus) Use driver specific ops if they exist"
   into two patches where the first handle _pmbus_write_byte_data, and the
   second handle _pmbus_read_byte_data.
 - Use voltage conversion functions in pmbus_regulator_get/set_voltage.

Changes in v5:
 - Remove PMBUS_VOUT_COMMAND voltage attribute added in v4 and use local
   sensor object for conversion.
 - Try to read MFR_VOUT_MIN and MFR_VOUT_MAX first, or else VOUT_MARGIN_LOW and
   VOUT_MARGIN_HIGH, to get voltage window.

Changes in v6:
 - Don't use camelcase.
 - Keep convertion of uV to mV as integer.
 - Convert limits to voltages before testing requested value.

Mårten Lindahl (4):
  hwmon: (pmbus) Introduce and use write_byte_data callback
  hwmon: (pmbus) Use _pmbus_read_byte_data with callback
  hwmon: (pmbus/ltc2978) Add chip specific write_byte_data
  hwmon: (pmbus) Add get_voltage/set_voltage ops

 drivers/hwmon/pmbus/ltc2978.c    |  12 +++
 drivers/hwmon/pmbus/pmbus.h      |   2 +
 drivers/hwmon/pmbus/pmbus_core.c | 136 +++++++++++++++++++++++++------
 3 files changed, 124 insertions(+), 26 deletions(-)

-- 
2.30.2


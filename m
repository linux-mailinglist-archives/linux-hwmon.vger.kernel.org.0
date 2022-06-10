Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1C55465F8
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jun 2022 13:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345387AbiFJLrx (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 10 Jun 2022 07:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240337AbiFJLru (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jun 2022 07:47:50 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605C992D08
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654861668;
  x=1686397668;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2b+PNY9KL+5E7zhVYPSIIW36uN9jJMCpzgCkhLvJGhM=;
  b=E3+r2XtEqPh8iVgkzVM7v/F1ncFz8yP2PVQp103kaiaMKprCsS5FTDiA
   kx93SFAoIqPcz18Zm00OhTPy/wN8QnZQju3cQy57mam3NnRkSduZW/V7T
   P30Qrzl/a0FmwDZre5Zmgl57tJ/sIuzV4fTr+g2YogfgeYK6JvY/rjD8I
   NTAK0pRYlFXG1BrCytfXtjfTtBYRK/pn6fUWZIlv5T8y0+fZvdLjOI1F/
   STj/6G2Pn6ycBVzbcXCSoaUiUCcwhI24xLneheBM5zvsX9Gro8pP4R4Qa
   QvQepsr/OJNgUBA9noddhYBc8WR3PC0bCScFTrMeZt+jq0S0P2uq4UACJ
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v2 0/3]  hwmon: (pmbus/ltc2978) Set voltage resolution
Date:   Fri, 10 Jun 2022 13:47:29 +0200
Message-ID: <20220610114732.2370242-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi!

When checking if a regulator supports a voltage range, the regulator
needs to have support for listing the range or else -EINVAL will be
returned.

This support does not exist for the LTC2977 regulator, so this change
adds support for list voltage to the pmbus regulators by adding
regulator_list_voltage_linear to the pmbus_regulator_ops. It also
defines the voltage resolution for regulators LTC2972/LTC2974/LTC2975/
LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have the
same stepwise 122.07uV resolution, and scales the resolution to a 1mV
resolution which is easier to handle.

These patches have been tested on an ARTPEC-8 developer board with a group
of LTC2977 power regulators.

Kind regards
Mårten Lindahl

Mårten Lindahl (3):
  hwmon: (pmbus) Introduce and use cached vout margins
  hwmon: (pmbus) Add list_voltage to pmbus ops
  hwmon: (pmbus/ltc2978) Set voltage resolution

 drivers/hwmon/pmbus/ltc2978.c    |  56 +++++++++++++++--
 drivers/hwmon/pmbus/pmbus_core.c | 104 ++++++++++++++++++++++++-------
 2 files changed, 134 insertions(+), 26 deletions(-)

-- 
2.30.2


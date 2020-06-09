Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B391F3EAF
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2020 16:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730635AbgFIO52 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 9 Jun 2020 10:57:28 -0400
Received: from lists.gateworks.com ([108.161.130.12]:54514 "EHLO
        lists.gateworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730110AbgFIO52 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jun 2020 10:57:28 -0400
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by lists.gateworks.com with esmtp (Exim 4.82)
        (envelope-from <tharvey@gateworks.com>)
        id 1jifju-0002Dv-Lu; Tue, 09 Jun 2020 15:00:34 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Robert Jones <rjones@gateworks.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 0/2] add 16bit pre-scaled adc mode to Gateworks GSC hwmon
Date:   Tue,  9 Jun 2020 07:57:18 -0700
Message-Id: <1591714640-10332-1-git-send-email-tharvey@gateworks.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The Gateworks GSC hwmon driver supports multiple modes of ADC's. Add a
mode for 16-bit pre-scaled values and clarify that the existing pre-scale
mode is 24-bit.

Tim Harvey (2):
  dt-bindings: mfd: gateworks-gsc: add 16bit pre-scaled voltage mode
  hwmon: (gsc): add 16bit pre-scaled voltage mode

 Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml | 5 +++--
 drivers/hwmon/gsc-hwmon.c                                | 8 +++++---
 include/linux/platform_data/gsc_hwmon.h                  | 3 ++-
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.7.4


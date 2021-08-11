Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61043E95B2
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Aug 2021 18:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhHKQQP (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 11 Aug 2021 12:16:15 -0400
Received: from mail.ispras.ru ([83.149.199.84]:32880 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhHKQQO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Aug 2021 12:16:14 -0400
Received: from kleverstation.intra.ispras.ru (unknown [10.10.2.220])
        by mail.ispras.ru (Postfix) with ESMTPS id 9FCD240A2BA0;
        Wed, 11 Aug 2021 16:15:45 +0000 (UTC)
From:   Nadezda Lutovinova <lutovinova@ispras.ru>
To:     Marc Hulsman <m.hulsman@tudelft.nl>
Cc:     Nadezda Lutovinova <lutovinova@ispras.ru>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rudolf Marek <r.marek@assembler.cz>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: hwmon: Error handling in w83793.c, w83791d.c, w83792d.c
Date:   Wed, 11 Aug 2021 19:15:14 +0300
Message-Id: <20210811161515.17842-1-lutovinova@ispras.ru>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In w83793_detect_subclients(): if driver read tmp value sufficient for 
(tmp & 0x08) && (!(tmp & 0x80)) && ((tmp & 0x7) == ((tmp >> 4) & 0x7))
from device then Null pointer dereference occurs.
(It is possible if tmp = 0b0xyz1xyz, where same chars mean same numbers).

It can be fixed just by adding a checking for null pointer, patch for 
this is in the next letter. But a question arised:
The array w83793_data->lm75 is used once in this function after switching 
to devm_i2c_new_dummy_device() instead of i2c_new_dummy(). And this 
function is called once (from w83793_probe()). Maybe this array should be 
deleted from struct w83793_data?

The same situation in w83791d.c and in w83792d.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>

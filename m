Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2486F123D45
	for <lists+linux-hwmon@lfdr.de>; Wed, 18 Dec 2019 03:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfLRCnO (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 17 Dec 2019 21:43:14 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55155 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRCnN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Dec 2019 21:43:13 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 175B4891AA;
        Wed, 18 Dec 2019 15:43:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576636990;
        bh=ZnzOQA8ZEc6czZsEMZfcwPMGN0vJwJqm2GI5CfLpdCI=;
        h=From:To:Cc:Subject:Date;
        b=lKCD51MvVfV2hrdlGzeU9BalzYx6tP+9FeEeaAl3742XmWhk9v7V/KcZEJgKXJjrZ
         WovKPLe35XG+RDXu6HLIAHN23BIPV1raKb0CP8FRNwvqejJV+GpBkaKgcyRsLQ2OSL
         pzd7X64CTOGzEpVnh07d59kyyJ9dpG2mAb4FyZ2leB6bxyWDroBqjil+CgrN1EXSmI
         ZbgStOvp78a29nwUcCHntcPDraQXIrdYu+shrwsbklGQT1WwMOiDK6JilpBYhaGCkC
         RIsbOnuKsoV12K/xfZk065iZrrqYtcgmRNr3pNJpvIOBI5Rn2nBLMmIYWsjlo4c2fX
         xt3JJtRK781LQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5df9923d0000>; Wed, 18 Dec 2019 15:43:09 +1300
Received: from logans-dl.ws.atlnz.lc (logans-dl.ws.atlnz.lc [10.33.25.49])
        by smtp (Postfix) with ESMTP id 6FBDD13EEA8;
        Wed, 18 Dec 2019 15:43:09 +1300 (NZDT)
Received: by logans-dl.ws.atlnz.lc (Postfix, from userid 1820)
        id D9361C03C3; Wed, 18 Dec 2019 15:43:09 +1300 (NZDT)
From:   Logan Shaw <logan.shaw@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org,
        Logan Shaw <logan.shaw@alliedtelesis.co.nz>
Subject: [PATCH 0/1] hwmon: (adt7475) Added attenuator bypass support
Date:   Wed, 18 Dec 2019 15:42:37 +1300
Message-Id: <20191218024238.19836-1-logan.shaw@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The ADT7476 controller supports bypassing all voltage input attenuators
and bypassing individual voltage input attenuators. This can be used to
improve the resolution of low voltages. Presently the driver does not
support this functionality, and this patch adds it.

Logan Shaw (1):
  hwmon: (adt7475) Added attenuator bypass support

 drivers/hwmon/adt7475.c | 162 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 161 insertions(+), 1 deletion(-)

--=20
2.23.0


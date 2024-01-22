Return-Path: <linux-hwmon+bounces-730-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A77E836993
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jan 2024 17:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EB44B2BEE6
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jan 2024 16:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBB886142;
	Mon, 22 Jan 2024 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5VcYy6t"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7C8613D;
	Mon, 22 Jan 2024 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936259; cv=none; b=TcTFCDI/wE/IX9dPioCSvfbgD9Yfe5C4PBkQjgGSyvLMs7M9VUtn+MoAf9NXcMohzV3BuHwjpKPvw0d0HC9NouBYe0Z2OBixDOdRzulAoCsqxiTkbuCSDmy4rmMyyE6btTV0u1XupUDNYmOgjv9PUVAFCVfpUMlK0T47InA8D90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936259; c=relaxed/simple;
	bh=gn8FSfQRkDXq/af0LTXiPw6BZGtSzjQnilXSpioE9l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heOisxcF5fZZsyYje1BNg+g1J9T/rwia2m4HA+z7ufBcGHPmXFllxALfbgnzhkME5/y1Ytx6+vywHH28UMOobewhCIGokcDPI1veaRmo9K4JOyIk3aNw+uy+rGja8xbFIncmJV/6hrKU3h1R0S2VTtGrDg9yMSDJVv8xUxVUI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5VcYy6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485FBC43390;
	Mon, 22 Jan 2024 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705936259;
	bh=gn8FSfQRkDXq/af0LTXiPw6BZGtSzjQnilXSpioE9l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5VcYy6tjz5HD0h49X0aOcBwBRg/gtl1a5JuziGYTKE+P8/Hq5Pmi3WGukwCB9Jyt
	 ZZymZefYtjl52+KRvyjqPb1qICxFVGabTazNRKlVUCbDtymVekGWWlMt+TzJ91c4Be
	 3k0dUf5fpH+3gCsZdfrRd3SIs2zA6wawovOMOn7QJ3COXvp5ZH2a8d3YlXpC5A6Yt1
	 PkP85yIZoFeTq3xaFgnUESHGnSb/CbnRDrAt49Ew7NzOmBcFT4IeVgD9khMaoRRNOR
	 rYR4jGtIHLrl7N/il7xwzoozxE+B0yN5ctVW2SDVjbXJ5ZZOe7z0tj6oawlL1/jsxB
	 mkhpkT2T4rrlg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xing Tong Wu <xingtong.wu@siemens.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 27/53] hwmon: (nct6775) Fix fan speed set failure in automatic mode
Date: Mon, 22 Jan 2024 10:08:28 -0500
Message-ID: <20240122150949.994249-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150949.994249-1-sashal@kernel.org>
References: <20240122150949.994249-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.74
Content-Transfer-Encoding: 8bit

From: Xing Tong Wu <xingtong.wu@siemens.com>

[ Upstream commit 8b3800256abad20e91c2698607f9b28591407b19 ]

Setting the fan speed is only valid in manual mode; it is not possible
to set the fan's speed in automatic mode.
Return error when attempting to set the fan speed in automatic mode.

Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
Link: https://lore.kernel.org/r/20231121081604.2499-3-xingtong_wu@163.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/nct6775-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 80310845fb99..9720ad214c20 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -2462,6 +2462,13 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 	int err;
 	u16 reg;
 
+	/*
+	 * The fan control mode should be set to manual if the user wants to adjust
+	 * the fan speed. Otherwise, it will fail to set.
+	 */
+	if (index == 0 && data->pwm_enable[nr] > manual)
+		return -EBUSY;
+
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
 		return err;
-- 
2.43.0



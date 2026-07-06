Return-Path: <linux-hwmon+bounces-15612-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4rj1AbwJTGrJfAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15612-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 22:02:04 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F477153DB
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 22:02:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NoxLhzZW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="H/K3k9MC";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15612-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15612-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99612325988C
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 18:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550F6387348;
	Mon,  6 Jul 2026 18:47:17 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A76F374A0E
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 18:47:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363636; cv=none; b=unS31iMTyI8SMrCA3h2cxyjYzv50vF00e9fQTwZq1rKwKk9yBY20P5jbuIVy6wutKwzQvsSmEpZlgYnZS+OtaSqlheL9XYDgcJ86WEe/tNpJgHotSJI3RJ5nQLf27bmiEhLpCsnRuj2qIDbskYhXsEpDKzvt3drG5Shg2gDYIgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363636; c=relaxed/simple;
	bh=OON3yrBUBI5i3rZM45extf8vRKEwdthVDb37mRNgaew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mtrKQd7eK+irYzrT5crGVQZiIEjirrZhbDz+PpWE+WnbsYmFnUN3yaK4V7tQLRArKAiP6KVTgn7cxXQHj6k4EW13kmeJ9OTUDA6rFLb6Id5sLLHrQeQf4FS0Jjp10QYpogwsTEnNGU+YtAtpKygzojncfkscz8ggJhiPQufD+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoxLhzZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/K3k9MC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFFdR900969
	for <linux-hwmon@vger.kernel.org>; Mon, 6 Jul 2026 18:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m/XFmTzGyIFMHErJ6/N1l2
	U6wTYZjIQ2iUo/yEmDvQo=; b=NoxLhzZWpOQbgzSzi72hUJg4e1d+Tfa84aaw9D
	Mw2+dD0GWhxf+gHO6JrmHZocJLJG7tDHogeBouSiBReb+vb+u6KsNw45H53UtLl8
	H2DQnBbUngXLBTJVdTMkMajYgTQW7CErmO4vX5wvkqqE7H/4t+VfTT+1SdRUGX+Y
	XZ/eoacZdOEwQ1RRHaC7qy4uYkwg35Hr81z0KeMCov28IeTgS8/gLKtwP+Tcg9Qf
	e4kT7BNhIJ34Y/2Bb7tzYkXyLQGFaoAjVMCewMLj4FLXxpNqavLmlk4ujZSNn7cC
	8AgGIr6iBg1BgnMy4rrwhhwH7tsT3nAHZ9x+6iDObdC1aHtg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7k1qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 18:47:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so317981185a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363629; x=1783968429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/XFmTzGyIFMHErJ6/N1l2U6wTYZjIQ2iUo/yEmDvQo=;
        b=H/K3k9MCT1v88h1C41WCsT6kjoDU7y35/syoOgHDXzVrNNtmtWgYOFtkeobKzLlA1t
         nA55hHXIc0rqnWYCg27mnoRIXAolh8NJhT9y08BV+K4tkUkowXNWCzwMOh2ouhQrzDZX
         IhtJbmu5Bi06vS2BcE6Zah/FX9EilVoi6zQY1N+qHBi5pROpDFy/A6Qu6uYfIEnuDeUr
         rgzCo9NUYQ9VvNgv6uayCS93WV3uOcLDADY0mvIXvU5dIsABtJMHjoHv5HpWhDUQx0WH
         Z79mhJKL2OB3KwzSyAn3GbjxhRrGXvAB5zPKleObnl4Gi3WSYB+rPZ42ptGRCUsKlu2L
         UZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363629; x=1783968429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/XFmTzGyIFMHErJ6/N1l2U6wTYZjIQ2iUo/yEmDvQo=;
        b=qpAP3x1VVA7UEm/S7krl27o6Mt/hlI2t9PzAxq+EJwKn7fqFzSjYbH/dMTg1l4F+je
         a9h124mGVPh2ru6xPNGph1HjtwDdmnkHLummXsHESbGBT+5oOXGLIzTOgiZOLTc/TznJ
         j2fvwQiibGx6E97b5LtfkTBhgI20kPjtVSjunthLFa/uYHD4METxhDYrf2rlWB1A6GWP
         B6rq48cVFrVALHgMOEt0hM7q9EzjdyrLa1yrxW4/jEIP6S95SKmpC8eUBGU5U/8dwWG1
         kMPE0pJuzB9ARlOkCImZL2QBKigVBMdTrDait/K2dRkqLYWaCpY/e3aw/r90bvAvXyqo
         s/XQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUpklhIdYsvsrDDsjKgy4whxqbWORtXKpOzwmdNUgBhTeb4GKQfFZ90CgEIbKX3Rb5KooG7cHjpaS8nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFSQWNoyw2ChBT3fKVniTfylbIeKUiF9sUOGDUh9E3V6dUBU9
	MqReKyqcE5WNhkCKZ4cY9APwLRliwoy4jQd5drL0VuQXUaI9u/g0NXf9U6O0t4xZgRqXADFYmLK
	OUa9LjHpveeknm82gDfHdPQGpSN4/Pt1g9SB0+WHHvJg13s2nSeenwHEomLE+PqjvC9xIZh9TPw
	==
X-Gm-Gg: AfdE7cmg/3L5PZjzcxUVdsy3sMJIih8owCr6viN69dW1z/t0uU/HyQmoLIq32yqMXUF
	LAvvqXpB2BXRlQI+KgqZMaDRvhJX4KIkQnJ9mpJrYRv6253141K82lBBuPv2m6vqz+yAxBOAVFK
	KHcTmh8PWa4YpcLdwP5AhEU9zsCwK8nRofnRelXgvVXotZBMJpCjtWSrSgGNvWRbT7i7E5dqdg0
	XvdeFUsY3bElZO86UA6mmbZLYOEb8+Zl0vUEY3pXEl9smzn8AKOB45RUA8K6R2jnESzBoizcB6J
	Pkdgj/w8cyQ+SEJbAiUwwRCu3u1VzfAe4eFKRz5e412cLvr16TkiM8N46mh04+WPvZqNkP2nWH3
	gzpYdguqS9fATyjJDM1Hy/H3wVkbnx49PHeSvBhOqXsjiYg==
X-Received: by 2002:a05:620a:28cf:b0:92e:5d76:743b with SMTP id af79cd13be357-92ebb600d64mr243760785a.56.1783363629498;
        Mon, 06 Jul 2026 11:47:09 -0700 (PDT)
X-Received: by 2002:a05:620a:28cf:b0:92e:5d76:743b with SMTP id af79cd13be357-92ebb600d64mr243756685a.56.1783363629086;
        Mon, 06 Jul 2026 11:47:09 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:07 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Mon,  6 Jul 2026 20:46:45 +0200
Message-ID: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX1/ySkaZz+q3K
 nwAAwpvIoCdZ4AYLPPoWeP2JApFXWHuVUju1G3YrTR2D6Gnprr8U4Xp/FyDqlLje5Yqu52714Wq
 GQV4/5eKRkmSICEYbzqT6t4amdwmecvcTIG9lfN56bBjRDAqsO4aMj+RSTN2+q6V0eaNfj2zx1x
 pCLPl9SJ6iFnGsCs2Zsj7Bn95UpExdDNXyARQgG+2louJM44ZSWTlexSNbn+/IhkmaIjUB9+M0a
 mroJmiK5kX5LA+X/GSEItHOi8ri/4cmFROw/OmIqAecYmrZoqpITxR3fUuJVm72MNd8SZ3wMPXj
 Z1wP2x4IMBDupEWNjQgs22y9FskxaB52w/2FMUK7k03+1BCOyvbNKbeTFfL895c2FFpDF8s/SYG
 FsxVoYiDHqkgeC41OGJ+xrnbkz8FWzG2yCQFfTYqcf9tgkyofRZg+nIpjeALIFz0s1+kOb6KEK+
 fhxMQKqeC9UKaCVaWuA==
X-Proofpoint-ORIG-GUID: vQe0TmUy1rl7KMaBBdKTrNj0kTEk_3rE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX8Dp02KYHrB2F
 pKq4/pSQ73IUIan/pS1Fw8oKKNB8Ot4tkcHYinXKzqgpsAZ57TxqUjH1kbMZOjtHW0ecwkAXFEs
 5n3mxncgVlxKvfXmUuv2jfOgxPFB4Pk=
X-Proofpoint-GUID: vQe0TmUy1rl7KMaBBdKTrNj0kTEk_3rE
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bf82e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15612-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97F477153DB

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch exposes the EC as a thermal sensor provider in the
device tree and defines thermal zones for the keyboard skin
temperature and the charging circuitry temperature. This allows the
generic thermal framework to react to EC-reported temperatures and
apply standard Linux thermal mitigation policies.

As the EC protocol is not fully decoded, the passive trip points
get/set actions are missing, so it is not possible to program a
threshold and receive an interrupt when crossed the way up or
down. Consequently, the thermal zone related to the charging circuitry
is polled every two seconds until we can set the trip points in the
EC.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Please make sure scmi-cpufreq.ko is loaded before testing

Thanks,

Daniel

---
 Changelog:
	v5:
	 - Added Reviewed-by tag (Ilpo Järvinen)
	 - Added the '#thermal-sensor-cells' property DT binding (Sashiko)
	v4:
 	 - Added the missing HWMON_C_REGISTER_TZ attribute (Sashiko)
	 - Fixed dependency with HWMON (Sashiko)
	 - Added tags
	v3:
	 - Removed event based because trip point are not yet well supported
	 - Added an empty line after variable declaration (Ilpo Järvinen)
	 - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
	 - Made switch consistent (Ilpo Järvinen)
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really

Daniel Lezcano (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal
    sensor provider support
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../lenovo,thinkpad-t14s-ec.yaml              |   5 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 4 files changed, 203 insertions(+), 1 deletion(-)

-- 
2.53.0



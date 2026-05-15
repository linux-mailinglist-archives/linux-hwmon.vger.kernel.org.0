Return-Path: <linux-hwmon+bounces-14123-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKz3J5D3BmpUpwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14123-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 12:38:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A063B54D7B8
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 12:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A81E3021EB0
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 10:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F42B43DA2B;
	Fri, 15 May 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBKi+bpm"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030243C05E;
	Fri, 15 May 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839437; cv=none; b=hP88XDSBkifJu7WKWJhfhrac/xqqpRpVbLBmJDuurvR3RKE9MIvNiE3kYkDz9gXPAhKbne586Z2hElqT7A2NgJJNDQFlGYqgqs8q3vH1gsAHytzcMehxXh0mjKxGE02L1Sm38Eahh2NkHs20qDDC7k4YSnklVCb96NFb+mqhTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839437; c=relaxed/simple;
	bh=rmXc2RV9XZGALh+ZdY2CWCSvGaYLblZ8chn0OvWGWEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LrdjZVHHplmXTAyv5jJzpnf2uK3IklnoovPrPolpQoBKtzbekx9k4s58HG3fmCeaZmGAqN8Z66wrz/SQP4i+v/NlArHGWlA21p9WN5FWBlZVRvT/WaWyZefDc8zdjZIhP3oJ3wkYR6vtqnm9nsYAbTZ0ekia58bmu+Yr/PJiw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBKi+bpm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7497C2BCB0;
	Fri, 15 May 2026 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778839436;
	bh=rmXc2RV9XZGALh+ZdY2CWCSvGaYLblZ8chn0OvWGWEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LBKi+bpmKyG+cH6YwIGomcrWS1lBBal434bNxd0C2HiuoJqhKdhpVqQN74tE7e9LM
	 kUnSbWV6LBzUcg5JuqGDTyKhI6XhB9pA4P9k8f3QJIkmz/DzW2qLdfO9AtUR4LgPgl
	 itnVs4uDGOIiIlCJm5ZssjYD7Tir789DRAS54PCK264yWyoTXKqq2UTFWAFC2y/ZKo
	 1RO5oZs4HU803yRqULjWtPvTBlUaPj7Hy40I+s7PAfLgl9EjwxJGCQ1DMO+pFFGhnu
	 yfubd4buO6vjuE45K+WftR5jXSW/kHsEoyoPxLMLUzYS487M107DnLwLZiR8fQHOxN
	 skhTfguZKGUEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515092128.483-1-hehuan1@eswincomputing.com>
References: <20260515092128.483-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 10:03:55 +0000
Message-Id: <20260515100355.A7497C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: A063B54D7B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14123-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] The timeout calculation for sensor conversion evaluates to 0 j=
iffies, causing all reads to instantly fail.
- [High] Missing pm_runtime_disable() in the devres cleanup path leads to a=
n unbalanced disable_depth.
- [High] Clock leakage on the IRQ request error path when CONFIG_PM is disa=
bled.
- [High] Race condition between ISR and main thread leaks PM runtime active=
 state.
- [High] Incorrect initialization order causes an IRQ storm during probe if=
 an interrupt fires early.
- [High] Lack of internal locking in eic7700_pvt_hwmon_read allows concurre=
nt hardware state corruption.
- [Medium] Useless and incorrectly ordered devres action for unblocking sys=
fs readers.
--

commit fe78922d5101b3a07ca5ea0fbd0fd5e9cba0dcc9
Author: Huan He <hehuan1@eswincomputing.com>

hwmon: Add Eswin EIC7700 PVT sensor driver

Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
supports temperature and voltage monitoring with polynomial conversion,
and provides sysfs interface for sensor data access.

> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
> index 0000000000000..cdcfa031cdbdb
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.c
[ ... ]
> +static irqreturn_t eic7700_pvt_hard_isr(int irq, void *data)
> +{
[ ... ]
> +	val =3D readl(pvt->regs + PVT_DATA);
> +	WRITE_ONCE(pvt->data_cache, FIELD_GET(PVT_DATA_OUT, val));
> +	complete(&pvt->conversion);
> +
> +	if (IS_ENABLED(CONFIG_PM))
> +		pm_runtime_put_noidle(pvt->dev);
> +
> +	return IRQ_HANDLED;
> +}

If the main thread in eic7700_pvt_hwmon_read() drops the usage count from 2
to 1 before the ISR drops it from 1 to 0, will both threads fail to trigger
the idle callback?

This could leave the device indefinitely in the active state. Should the ISR
use pm_runtime_put_autosuspend() or pm_runtime_put() instead of
pm_runtime_put_noidle()?

[ ... ]
> +static int eic7700_pvt_read_data(struct pvt_hwmon *pvt,
> +				 enum pvt_sensor_type type, long *val)
> +{
> +	unsigned long timeout;
[ ... ]
> +	timeout =3D 2 * usecs_to_jiffies(ktime_to_us(pvt->timeout));
> +	ret =3D wait_for_completion_timeout(&pvt->conversion, timeout);

Because pvt->timeout is 333 microseconds, will usecs_to_jiffies(333) evalua=
te
to 0 on standard kernel configurations like HZ=3D1000?

If so, this acts as a non-blocking check and wait_for_completion_timeout()
could instantly return 0, causing all reads to permanently fail with
-ETIMEDOUT.

[ ... ]
> +static int eic7700_pvt_hwmon_read(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int ch, long *val)
> +{
> +	struct pvt_hwmon *pvt =3D dev_get_drvdata(dev);

The driver registers the temperature sensor with the thermal subsystem via
the HWMON_C_REGISTER_TZ flag.

If thermal zone background polling directly invokes this read callback while
a user concurrently reads a hwmon sysfs attribute, is there a race conditio=
n?
Does this need an internal mutex to prevent concurrent hardware state
corruption?

[ ... ]
> +static struct pvt_hwmon *eic7700_pvt_create_data(struct platform_device =
*pdev)
> +{
[ ... ]
> +	ret =3D devm_add_action(dev, pvt_clear_data, pvt);

Because devres actions execute in reverse order of registration (LIFO), will
this action run after the hwmon device is unregistered?

Since hwmon unregistration blocks until all active sysfs read operations
finish, the reader would have already completed before pvt_clear_data runs,
which might make it ineffective for unblocking sysfs readers.

[ ... ]
> +static void eic7700_pvt_disable_pm_runtime(void *data)
> +{
> +	struct pvt_hwmon *pvt =3D data;
> +
> +	pm_runtime_dont_use_autosuspend(pvt->dev);
> +	pm_runtime_force_suspend(pvt->dev);
> +
> +	if (!IS_ENABLED(CONFIG_PM))
> +		clk_disable_unprepare(pvt->clk);
> +}

Should this custom devres cleanup action call pm_runtime_disable()?

If the module is unloaded and then re-probed, could the unbalanced
disable_depth cause an "Unbalanced pm_runtime_enable!" warning and corrupt
the power management state?

> +
> +static int eic7700_pvt_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (IS_ENABLED(CONFIG_PM))
> +		clk_disable_unprepare(pvt->clk);
> +
> +	ret =3D eic7700_pvt_request_irq(pvt);
> +	if (ret)
> +		return ret;

If CONFIG_PM is disabled, the clock remains enabled. If
eic7700_pvt_request_irq() fails here, does the function return without
disabling the clock? This could permanently leak the clock reference because
the devres cleanup action is not yet registered.

> +
> +	pm_runtime_enable(&pdev->dev);

Since the IRQ is unmasked before pm_runtime_enable() is called, what happens
if the hardware asserts an interrupt in this window?

If eic7700_pvt_hard_isr() fires, pm_runtime_get_if_active() would return
-EINVAL and the handler would return IRQ_NONE without clearing the interrup=
t.
Since the interrupt is level-triggered (IRQF_TRIGGER_HIGH), could this cause
an infinite IRQ storm that locks up the CPU?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515091942.449-=
1-hehuan1@eswincomputing.com?part=3D2


Return-Path: <linux-hwmon+bounces-14445-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ4dDQ95EWrymQYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14445-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 23 May 2026 11:53:19 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C94955BE5D7
	for <lists+linux-hwmon@lfdr.de>; Sat, 23 May 2026 11:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A8AE30054C9
	for <lists+linux-hwmon@lfdr.de>; Sat, 23 May 2026 09:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BAD33F59B;
	Sat, 23 May 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b="rtoHHaRU"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5B037DE85
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529995; cv=none; b=E2S/JiR7azFTzaUj99KLeX/F+5VV6f3u8wzuw+wFCUnD7jJ3QjXkP16r9uI9qfgL8gWfT1EnroIJ2bTbko/hv6UKHzVe0pEK7vwL5ySkg6gq8TzyzgPRbAZrna/pbSpIUyvv2VN77hukuox9SpljIIPhEHQBZIl0d2YIKoj0Vz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529995; c=relaxed/simple;
	bh=4B1x19VugtaQ2wdHjWNY+uHOL74AGbbd4rFy9h9l0gI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=MFuu7vZ3xvI/67H2l1zE1uYMHpKLpbx7esVsnZ8zQm/1IrhHD25s5DCWO2I70Lm2vjR4QhCsPuuPFDYfUMdmuGhxZKmxVYv2+fkCQaJLZkz7iWtEtBBJdOmXG2zFrAG40Qrp5ga58bRcbjKSEt6DNl/WavVcjfoQl5CvXewKNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de; spf=pass smtp.mailfrom=jhbruhn.de; dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b=rtoHHaRU; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jhbruhn.de
Received: from boethin.uberspace.de (boethin.uberspace.de [185.26.156.96])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 5BCE617F76B
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 11:53:11 +0200 (CEST)
Received: (qmail 17432 invoked by uid 990); 23 May 2026 09:53:11 -0000
Authentication-Results: boethin.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by boethin.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sat, 23 May 2026 11:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 23 May 2026 11:53:10 +0200
Message-Id: <DIPYQFU4CSI6.23E8KAFNAQ859@jhbruhn.de>
From: "Jan-Henrik Bruhn" <hi@jhbruhn.de>
To: <sashiko-reviews@lists.linux.dev>, "Jan-Henrik Bruhn"
 <kernel@jhbruhn.de>
Cc: <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (lm63) expose PWM frequency and LUT
 hysteresis as writable
X-Mailer: aerc 0.20.0
References: <20260522202250.3184791-1-kernel@jhbruhn.de>
 <20260522205930.3E2EF1F000E9@smtp.kernel.org>
In-Reply-To: <20260522205930.3E2EF1F000E9@smtp.kernel.org>
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.999999) MIME_GOOD(-0.1) MV_CASE(0.5)
X-Rspamd-Score: -2.599999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=jhbruhn.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=4B1x19VugtaQ2wdHjWNY+uHOL74AGbbd4rFy9h9l0gI=;
	b=rtoHHaRU82sPROIzX8shHizGjcR5COY7D04tyFSdHzBo8C5IhZ8Meksfe0bPodDdenqHVySLJ+
	MwgAU29+KOvOGtKk6wn7tGbjhDnnevgCxhWBieQI2KU4PvXNbZp8OojykzlFpDttjwsuwzoNGZKC
	1OZVaMeNJnPM247c2INlDqOhW5azdwRn+n/QEHOXwL87sKRBBM2DV0265VEXAaq4afJCZmm8NswK
	fN/U4Xql6EyYtYhT2QQcX0DoDUFXCyNCd0d6GtRtCsqkm0ZzVv4sfqxyoil3OYU8TgwLQBJp3M51
	6ZLpXcBvyiUMGVGfQhBbWeuObI7w834NsfWT44LdRw9I7W5rHLRXUY9gNsGI7+xqSboJLG21AxiO
	E9u3seLMDSG3f7LmFm1HTi4zaMQgF0PQPlxTm4CINoX0vhGXNtbZGv89Y1tA1lYik5zpTy9hFN1d
	nQHDFdl5Yy7JgwLS0v+CDHbW6hvg0wnzrLGieqUwVPUryO+sM2ccpsqhT+kdQJwGz+35b0Rb5jv/
	pvcNWcS2OEavH8fdFmuQiUFkNZvO7CckpSg3yhztp6kPtXrZz6IuePqgmWWEuV5ql7Qeve2nLzRf
	c9uY2V7lTakHH/NUz27xazujxIKDG6HnzYDMInariaYlsfw9J6sj9MYoQXZfzUBYw1Pj65UuOgoH
	o=
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[jhbruhn.de:s=uberspace];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[jhbruhn.de:+];
	TAGGED_FROM(0.00)[bounces-14445-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[jhbruhn.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hi@jhbruhn.de,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C94955BE5D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks, responses inline:

> Does lm63_update_device() release the update_lock before returning?
>
> If so, is there a race condition here? If another thread modifying these
> variables in pwm1_freq_store() runs concurrently, could this code read th=
e
> new config_fan clock base but the old pwm1_freq divider, resulting in an
> incorrect frequency calculation?

The new show function follows the same pattern as the existing show functio=
ns
in this driver: lm63_update_device() refreshes the cache under update_lock
and returns, and the caller then reads cached fields without holding the
lock. Changing that would be a driver-wide change which I do not want=20
to slip in here.

> Can a concurrent update to manual mode lead to a desynchronized cache?
>
> Since this check for manual mode is outside the data->update_lock critica=
l
> section, could another thread concurrently disable manual mode before the=
 lock
> is acquired below?
>
> If that happens, the hardware would ignore the write to LM63_REG_PWM_FREQ=
,
> but the driver unconditionally updates data->pwm1_freq, potentially leavi=
ng the
> software cache permanently desynchronized from the hardware.

Fixed in v3: the manual-mode bit is now tested after the in-lock read of
LM63_REG_CONFIG_FAN.

> If this read fails, the function aborts and returns an error code without
> updating data->pwm_highres.
>
> However, data->config_fan and data->pwm1_freq have already been updated i=
n
> the cache and written to hardware. Does returning an error here leave the
> hardware state out of sync with what userspace expects, while keeping the
> driver's PWM scaling formula permanently desynchronized from the hardware=
's
> actual operating mode?

Fixed in v3: the LM96163_REG_CONFIG_ENHANCED read now happens before the
LM63_REG_CONFIG_FAN / LM63_REG_PWM_FREQ writes, so a failure aborts without
touching hardware.

> Should this function check if the device is in manual mode before writing=
?
>
> If a user attempts to write to this attribute while the device is in
> automatic mode, it looks like the hardware will silently ignore the write
> because the LUT is locked, but the driver updates data->lut_temp_hyst.
> Does this cause the sysfs interface to reflect a false state?

Per the LM63 datasheet ("Register Descriptions in Functional Order",
page 21), register 0x4F (LUT_TEMP_HYST) is writable regardless of the LUT
lock state. Only the LUT entries themselves are gated by manual mode.


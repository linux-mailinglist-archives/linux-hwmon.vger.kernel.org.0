Return-Path: <linux-hwmon+bounces-14216-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJybFHjKCGr65QMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14216-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 21:50:16 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3924855D99D
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 21:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 497B93003823
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 19:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5EA371045;
	Sat, 16 May 2026 19:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3dJzLnE"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D63371042
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 19:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960703; cv=none; b=rH2LuA33aMMIrJT5naXGuDD8q0Nv/M3oCZODR3L8MJbONGfTKRVC2DPaESGSm/RwX3+/xjWm0CnZp7W0XQbC6ID+rVey7bjrgS4TK0pPl3XgxjeJFNE2WgQFoRSRUYNWO6r7XDmXGRiFYwXnfloaQXJbiEwNO/QCkAOTbSehjrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960703; c=relaxed/simple;
	bh=vfTAZiVDMEFiz+XnvzQxLUkcvrHbApboM5S7qaPnbkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dYzaVgTMEHdow7OieT0MsU49ySwGRns+otSnDYPFG0hDGqZIBLD2YLUG4M45pr4HFhyaeG3nAsbAD9xBSgEybT/JL1AE5TRg+ZLaM/NIco8qhjUXth8YFvMwoaVGptyaCb885gpdZ/qnwIZn3mvO18mo7KKD+ZH7Y1ffL0OjIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3dJzLnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B563C19425;
	Sat, 16 May 2026 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778960703;
	bh=vfTAZiVDMEFiz+XnvzQxLUkcvrHbApboM5S7qaPnbkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=H3dJzLnEYOg0rrOTxYQhqBCaARBkEXEzRaJRBYiJFtPwUeeiDK/q7QMQmxaeCxOJw
	 eaWhvsFVqzj7QzzWNVMNkLMTrFxbPHpwy8d2up8VcReDjlQmfVZXMUOMcpyxUkeJ/2
	 szeColSAuZaKyM8iiD3awK5d6yirr3fksOi+eQIZwCB5VFtiC17vh6fYAB1x4bHeFn
	 IwlVQ1WPEsNDxaaTJJHsJWQmZsRJOcrLULrhFKD06Kz+jjw33erMgvOkMc/0N3D4D6
	 d4Ykz4ghJzORn6WYp0YVBblZtoLn1tYnj9+jm35p8fHXsDh/PcBp3tbsvqF4U7FW3d
	 +bvX074De7khw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: raspberrypi: Add voltage input support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Chakraborty" <chakrabortyshubham66@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
References: <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:45:02 +0000
Message-Id: <20260516194503.3B563C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 3924855D99D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.34 / 15.00];
	URIBL_BLACK(7.50)[packet.id:url];
	MISSING_MIME_VERSION(2.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14216-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_NO_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.030];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,packet.id:url]
X-Rspamd-Action: add header
X-Spam: Yes

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Unconditional self-rescheduling of the background workqueue le=
ads to a use-after-free on device removal.
- [Medium] The driver incorrectly detects and exposes unsupported voltage c=
hannels due to unverified firmware responses.
--

commit aa874218705dba1c84bc41a7c3b61abd93bbf0a2
Author: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

hwmon: raspberrypi: Add voltage input support

This commit extends the raspberrypi-hwmon driver to expose firmware-provided
voltage measurements. It adds core and SDRAM voltage inputs, converting
the values from microvolts to millivolts for the hwmon subsystem.
Inputs are only exposed if the firmware reports support for the correspondi=
ng
voltage ID.

> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberryp=
i-hwmon.c
> index a2938881ccd2f..4f96f37116f32 100644
> --- a/drivers/hwmon/raspberrypi-hwmon.c
> +++ b/drivers/hwmon/raspberrypi-hwmon.c

[ ... ]

> @@ -56,6 +70,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmo=
n_data *data)
>  	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
>  }
> =20
> +static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
> +				    long *val)
> +{
> +	struct rpi_firmware_get_value packet;
> +	int ret;
> +
> +	packet.id =3D cpu_to_le32(id);
> +	packet.val =3D 0;
> +	ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
> +				    &packet, sizeof(packet));

If the firmware does not support the RPI_FIRMWARE_GET_VOLTAGE tag or the
specific voltage ID, could the mailbox transaction still return 0 without
modifying the tag buffer?

If so, packet.val would remain 0 and this function would return success.
During probe, this would cause the channel to be incorrectly flagged as
supported, exposing sysfs files that permanently read 0mV.

Would it be safer to initialize packet.val to a sentinel value like ~0
before querying the firmware to verify the voltage ID is actually supported?

> +	if (ret)
> +		return ret;
> +
> +	*val =3D le32_to_cpu(packet.val) / 1000;
> +	return 0;
> +}
> +
>  static void get_values_poll(struct work_struct *work)
>  {
>  	struct rpi_hwmon_data *data;

Does the unconditional rescheduling in get_values_poll() cause a
use-after-free regression during driver removal?

If the work function executes concurrently with driver unbind,
cancel_delayed_work_sync() will wait for it to finish. However,
get_values_poll() currently reschedules itself just before returning:

get_values_poll() {
        ...
        schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
}

After cancellation completes, devres frees the memory for data. When the
rescheduled work executes later, it accesses the freed data pointer.

Could a shutdown flag be added to safely prevent rescheduling during
teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516191555.1797=
8-1-chakrabortyshubham66@gmail.com?part=3D2


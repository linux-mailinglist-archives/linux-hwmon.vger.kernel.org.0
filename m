Return-Path: <linux-hwmon+bounces-14065-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH31MYp7BWp2XgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14065-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 09:36:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6889753EE6C
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 09:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D83103004D31
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 07:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB643B2FCA;
	Thu, 14 May 2026 07:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2P4sbY+"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6E3B27C4
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778744200; cv=none; b=BzzterFp1ypnTQz/aAaqDFPcyniCv7XURdPschTcqU1YC5Vlj3BTQ2n0LcX76Jw8eeF6i9ZrGxVIXebiEKFQ8ZO63nrvyOA6IoAEML3Sd5M1VJEZFm8r5Y7io64yVU0ZE3zPMePB8If4UMaLC0N20zS6BPrbH90pd26izkKjkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778744200; c=relaxed/simple;
	bh=UI04wNFPPT3rrlI91nuUxUQH70vXEvo8Dkab3K6b6e0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VZYLjTVwZAox5QOem6arwOlWIOmuzbpHVENPm/KfQRq0g00y8fkl8w9PsF5j5Tu9YZKxtr9wdpBK/Clzo9cFtFjK0sJwzaUp5yg7+l5Q+NqIcChO6lloeR9tc+GKiSnWPnraW+qTykgodFmVNhpKYuhgDz5h2yLd84iqLoHZHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2P4sbY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997DDC2BCB7;
	Thu, 14 May 2026 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778744199;
	bh=UI04wNFPPT3rrlI91nuUxUQH70vXEvo8Dkab3K6b6e0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=j2P4sbY+NomtdQ1fQoYxgaa8eB0Zlqs9WjhupgmCE4hJcmdqtZFingZylEFIRCydx
	 ANm0aiK8JOz/iV3FETaPF37RunNKWTx5FPZjNs8F6sMSBfC8Ue9+8Jz7jblDH8des/
	 cdMmCqe1KRr2W7C8sVzfpfKFDPswtwEon7iWCjhaRR8Ty5VIoWier4iykN5GMwQn6y
	 lwJjXOp5zkWX1uXI7uKhyb4v5s98S6nL9Kh01L0uGqJyaxtn/t5OUCDum6D9DYyOOS
	 uZhrOKFW0LsmwkU0F6CQjUf8/fwctcl86wmIzcFKwfQ51NVBpm9IY0SVL45S3VAN9l
	 sLRczjZ8Q/x9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v1-1-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-1-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 07:36:39 +0000
Message-Id: <20260514073639.997DDC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6889753EE6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14065-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,qualcomm.com:email,lists.linux.dev:replyto,smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Misleading and redundant log message introduced during probe.
- [Low] Incorrect format specifier used for an unsigned integer.
--

commit bbe520bfc76fbb3ccbb1f090461778e8837406ba
Author: Alex Tran <alex.tran@oss.qualcomm.com>

powercap: arm_scmi_powercap: Log number of powercap domains

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This commit adds a log
message indicating the powercap domain count after a successful probe.

> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_=
scmi_powercap.c
> index ab66e9a3b1e2c..48d721385f946 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c
> @@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sd=
ev)
>  		return ret;
> =20
>  	dev_set_drvdata(dev, pr);
> +	dev_info(dev, "Initialized %d powercap domains\n", pr->num_zones);

Before this line, scmi_zones_register() is called, which already logs the
number of successfully registered domains:

    dev_info(dev, "Registered %d SCMI Powercap domains !\n", reg_zones);

Does this new dev_info() call create redundant and potentially conflicting
output in the kernel ring buffer?

Additionally, scmi_powercap_probe() explicitly skips domains with abstract
power scales earlier in the function:

    if (!spz->info->powercap_scale_uw &&
        !spz->info->powercap_scale_mw) {
        dev_warn(dev,
                 "Abstract power scale not supported. Skip %s.\n",
                 spz->info->name);
        spz->invalid =3D true;
        continue;
    }

Because pr->num_zones represents the total discovered domains rather than
the number actually initialized, could the count in the new log message be
misleading?

Finally, pr->num_zones is defined as an unsigned int in
struct scmi_powercap_root. Should the format specifier be %u instead of %d
to ensure type correctness?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v1-0-00b47b1be009@oss.qualcomm.com?part=3D1


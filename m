Return-Path: <linux-hwmon+bounces-11464-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GACBG7MJe2k6AwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-11464-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Jan 2026 08:18:11 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 170B7AC885
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Jan 2026 08:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26CF93019516
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Jan 2026 07:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F85336EE9;
	Thu, 29 Jan 2026 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrIN+ZMu"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B4819004A;
	Thu, 29 Jan 2026 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671086; cv=none; b=QorqfV3V32fCjjff3kDiBRG/WXYwgnFKmtmst3seSBDAbxcIhmJg9iTrnywV4XN8eAmiT0ytQYUiERYZfXM5xgQ+2j2VC0AsrvXahfZyrZOEjEEYSBE5GjHzaE8ISNnxR1mU9Nesk5vAfzRZaw78zWdLN3c+/l5BYtCgNnM/kAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671086; c=relaxed/simple;
	bh=Oet2Ln0th1MRhkR3vcBzvenkkg7ygxTOK1r4x0Hhp50=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jXJXic+PxJXvMGkzg9BweX6STI5zLJVpXgkUNwex0UuHgGmpBmStu+lqqszb39zl8ruCYy0YtDSFyqxcFnqQFWgK1voUzcqvXpAEWEelxZxH2+k84RrlqA/1su9UlvDLwQ3JLMop6FS+bFAy8jMsiVYZUDUdrB4GaZOanILvmtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrIN+ZMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25E9C4CEF7;
	Thu, 29 Jan 2026 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769671085;
	bh=Oet2Ln0th1MRhkR3vcBzvenkkg7ygxTOK1r4x0Hhp50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nrIN+ZMu69YummFrvVQMMhOOe4Kmw77A3duaxW73WZpbRcLKYdOjZnZRk4AU4H+02
	 4n2eDRKa+l3pDGT3uIyRm69xYLfro3oLEj15gehw4wIs0RMYVwr0JPVYBwMIRL6GZf
	 29zVADBbF+TNhHnfinIzpL/0BrybzulkbkdsraPIcGU8bF2PnL+0kOGbQXHiZMwkov
	 TEn/9cOuqgB0rQqasjNDHPCx3zV8jakbEU2Mwl/li7Tf03QmatfnaOf1+dVoJhpqXo
	 iIbtGjj0H06kBD3OdW/opV2XXfXEenSKp/OqPmnudHZ2BjDGqqFWFFrqV8dCWJiFUz
	 MsMuTGNPvVP6A==
Date: Thu, 29 Jan 2026 08:17:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Charles Hsu <hsu.yungteng@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet
 <corbet@lwn.net>, huah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 2/2] hwmon: pmbus: add support for STEF48H28
Message-ID: <20260129081743.50ab5a66@foz.lan>
In-Reply-To: <46a42764-6cf0-46c8-b764-4c4b394b04d0@roeck-us.net>
References: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
	<20260126063712.1049025-2-hsu.yungteng@gmail.com>
	<46a42764-6cf0-46c8-b764-4c4b394b04d0@roeck-us.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11464-lists,linux-hwmon=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,roeck-us.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 170B7AC885
X-Rspamd-Action: no action

Hi Gunter/Charles,

On Mon, 26 Jan 2026 16:12:42 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Jan 26, 2026 at 02:37:12PM +0800, Charles Hsu wrote:
> > Add support for STEF48H28 hot-swap controller.
> > 
> > Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>  

This patch completely broke docs build, as it is using a markup meant
to identify section titles to mark the beginning/ending of a table.

Also, please use get_maintainers.pl:

	$ ./scripts/get_maintainer.pl Documentation/hwmon/stef48h28.rst
	Charles Hsu <hsu.yungteng@gmail.com> (maintainer:ST STEF48H28 DRIVER)
	Guenter Roeck <linux@roeck-us.net> (maintainer:HARDWARE MONITORING)
	Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
	Shuah Khan <skhan@linuxfoundation.org> (reviewer:DOCUMENTATION)
	linux-hwmon@vger.kernel.org (open list:ST STEF48H28 DRIVER)
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
	linux-kernel@vger.kernel.org (open list)

(adding documentation folks to C/C and also -next maintainer)

Please apply the enclosed patch to fix linux-next.

Thanks,
Mauro

---

[PATCH] docs: hwmon: stef48h28.rst: fix a documentation build
 breakage on -next

The table there is completely misformatted, causing Sphinx to
badly fail:

Traceback
=========

      File "/usr/lib/python3.14/site-packages/sphinx/util/parallel.py", line 137, in _join_one
        raise SphinxParallelError(*result)
    sphinx.errors.SphinxParallelError: docutils.utils.SystemMessage: /new_devel/docs/Documentation/hwmon/stef48h28.rst:45: (SEVERE/4) Missing matching underline for section title overline.

    =========================================================
    in1_label               "vin".
    in1_input               Measured voltage. From READ_VIN register.

The full traceback has been saved in:
/tmp/sphinx-err-wpoae2yk.log

Fixes: aef6b6b5d5bc ("hwmon: pmbus: add support for STEF48H28")
Cc: stable@vger.kernel.org

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/hwmon/stef48h28.rst b/Documentation/hwmon/stef48h28.rst
index 00bef9e55651..3bfc37f3be8e 100644
--- a/Documentation/hwmon/stef48h28.rst
+++ b/Documentation/hwmon/stef48h28.rst
@@ -42,7 +42,7 @@ The driver supports standard PMBus driver platform data.
 Sysfs entries
 -------------
 
-=========================================================
+================	========================================================
 in1_label		"vin".
 in1_input		Measured voltage. From READ_VIN register.
 in1_min			Minimum Voltage. From VIN_UV_WARN_LIMIT register.
@@ -53,11 +53,11 @@ in2_input		Measured voltage. From READ_VOUT register.
 in2_min			Minimum Voltage. From VOUT_UV_WARN_LIMIT register.
 in2_max			Maximum voltage. From VOUT_OV_WARN_LIMIT register.
 
-curr1_label "iin".
-curr1_input Measured current. From READ_IIN register.
+curr1_label		"iin".
+curr1_input		Measured current. From READ_IIN register.
 
-curr2_label "iout1".
-curr2_input Measured current. From READ_IOUT register.
+curr2_label		"iout1".
+curr2_input		Measured current. From READ_IOUT register.
 
 power1_label		"pin"
 power1_input		Measured input power. From READ_PIN register.
@@ -70,4 +70,4 @@ temp1_max		Maximum temperature. From OT_WARN_LIMIT register.
 temp1_crit		Critical high temperature. From OT_FAULT_LIMIT register.
 
 temp2_input		Measured temperature. From READ_TEMPERATURE_2 register.
-=========================================================
+================	========================================================


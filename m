Return-Path: <linux-hwmon+bounces-15437-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kvNgIcfbQmrrFAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15437-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:55:35 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D68D06DEBD3
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:55:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UIyWFdod;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15437-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15437-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 746DC3023526
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 20:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52C739F190;
	Mon, 29 Jun 2026 20:55:31 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D1388369
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:55:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766531; cv=none; b=Y5zP3kDdxFIni8OGB6Mgh6iIZNndE1WzzEe3riwnroiwT+WGCohADju9XBTQNEC4AMqj/OyOfjf3Dr26Bh9Nv+5W7fC545YmUsAicyAJKKejgWFDCGri4TIYXlVrqnGDRhoFuBaY/Hw8A5jLp1adUZroSOjsi29fP6rozOs+014=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766531; c=relaxed/simple;
	bh=KJ5qYDAXbSZpW+fxlXr7C8SDvTtYGZaUAly4G7f3Q74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxFTz1bOGoG72S4oIM8TE3Fyot2ibiIx1OnGwvidlaURtC3vuo+pr/tXH1rrK0xQpP83SWEfxb/SKh2lQxe48VpV8KXqh2IYFGWU5GriVt04gavh0YAaElS82RT9fe+VWwpQrH2DgsXuiLm+ZbZy42lZwvrO6ENa6vAsgZwUOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIyWFdod; arc=none smtp.client-ip=74.125.82.182
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30eac9abd79so2882308eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766530; x=1783371330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6ju4JjRWVYXUbqVktnuuryEIlFiwEfbWXQylb3NQO0=;
        b=UIyWFdod2gJqPYQVneVn8EHGglC2FRTBgHOdi+vlI1aDN3M1k2lm5BNKfVNplZrq5Q
         pAwroLMnS20hackqPZWWZcSoRn1lrFbpOUAvXGy5ujThAx9M+i5QGoNfLAj8ysho9Ep6
         bIKA9GyHCrH2gjZckvwRe9MxpaxHvew9G14kiV+vaS26sPoimldqvGoCbP0hV6VOJzNV
         kmNw0vgTEn1rxEwJxxB8XQaedhvNVjQZopHGzu0ZKImlZXFzowH4aHE0Jt5MJRXf0FDj
         sAUaBw4XjV7TetXgfrMPwyZNC1kerI8UQlTFC/nQ+LlCz6v3hEwc2ncWNvRye7Ujdthn
         ciVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766530; x=1783371330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I6ju4JjRWVYXUbqVktnuuryEIlFiwEfbWXQylb3NQO0=;
        b=lrwsxWIfM12Or/E1CHgj48+67FVFv1JKdaqnfwVUXazqQ9Fns8OHYFPsoBmKSJDyOP
         V1w6smDc7BEix+9zF9rkRiG7wkwypR3OR8OwnuP4tgL3mkQ09phDYVzgWJPQJBqzwl3f
         6K//DhEuPURS6CuRN/tV2kq/YLTq6opM9nQE7lyDTGA1FzRrnlkN7n7b5FqJCXB+blXz
         nrb/DeRrOr8kqFK08wlGY70vep11lCc5Te3PIrjOrL0wfEPgnfMXnyX3yYf+4vlBgU5D
         PtFtfMKFyubBQ5uGIENCiRugXx/BbWzf3JzXtaKY5+ckWzJa3D52xR2sGBuBdceAesuX
         7ztQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Y3xPlhHJu7NzIIDijnbjFiDKfTQGSrO+I9BDqa1sszFY5Th30nsvhrQwo4F4zKyRCcdxHbuenqVUkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEEr3DlAhCoqY4bXmB1k6BAAi2Bej/dMv1mDbOVQeUc3trhzD
	zx6f+KVaPerWPHbrIM4Aky9CtXbsUXmwpwqCsferwDyzm2zZFTOh402d
X-Gm-Gg: AfdE7clD92HSxeEaK9PgIMPTdEBr0/dMvRuUuE5uvNnR/MJ8pqBhiXeJmM5hlLAJiXp
	QjymNKhqVkmsUw6xgOUOh45Aep9pXlxCy0PlwsER5ppNXMSDjhjj5YgLy2uOAtjr5i5u5CwcqPC
	LkAo5Mwdeq3Ac8Wn+C9YLq2KUK+WsAjNQux7ubjIKeAEMdFQ1Fa+wf7uuyE//lB1Ey6dHudJhmx
	XhzMwvTx/+XZX0S1aLV4fFCJfN1SY+nPCx+GtRNgt5KB4h9wE+m5FrHZ5YOM1QNxilLH+pHjbWm
	t40dGhoPj4Cs3uVy6fjBH7+yDsrywPybFrLgccDsibZziyMrWjU9xYkK5EKsSKjPPGzFgNZplAh
	NKHxobO5BJejg8SRXSLx0Sqd6p4xEejzq7BiZSHRNyxrbFPjPaeKpIYavuuif8yRCqZ0E4YUC7C
	TOSIZ38hq/VnJVJtbQlHAH4zexEA==
X-Received: by 2002:a05:7300:6c2b:b0:30c:ab97:d7b0 with SMTP id 5a478bee46e88-30ee140767dmr604274eec.42.1782766529668;
        Mon, 29 Jun 2026 13:55:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee31da63asm847354eec.21.2026.06.29.13.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:55:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:55:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/9] hwmon: adm1275: Support ROHM BD12780
Message-ID: <af694b9a-fa31-4665-aa47-a7822931058d@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <e1e6e6218c08b562311356ef9c57378d32c26b08.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1e6e6218c08b562311356ef9c57378d32c26b08.1782458224.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15437-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:vasileios.amoiridis@cern.ch,m:kimseer.paller@analog.com,m:tomtsai764@gmail.com,m:chris.packham@alliedtelesis.co.nz,m:robert.coulson@ericsson.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,cern.ch,analog.com,gmail.com,alliedtelesis.co.nz,ericsson.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D68D06DEBD3

On Fri, Jun 26, 2026 at 10:24:55AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ROHM BD12780 and BD12780A are hot-swap controllers. They are largely
> similar to Analog Devices ADM1278. Besides the ID registers and some
> added functionality, the BD12780 and BD12780A mark PMON_CONFIG bits
> [15:14] as reserved. Hence TSFILT setting must be omitted on these ICs.
> 
> The BD12780 has 3 pins usable for configuring the I2C address. The
> BD12780A lists the ADDR3-pin as "not connect".
> 
> Support ROHM BD12780 and BD12780A controllers.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter


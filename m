Return-Path: <linux-hwmon+bounces-12532-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCieF/kvvGnquAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-12532-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 19 Mar 2026 18:18:49 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B22CFCAD
	for <lists+linux-hwmon@lfdr.de>; Thu, 19 Mar 2026 18:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13B123076AFE
	for <lists+linux-hwmon@lfdr.de>; Thu, 19 Mar 2026 17:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4B83EDAC1;
	Thu, 19 Mar 2026 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iv6+cWyO"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45F38550C;
	Thu, 19 Mar 2026 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939905; cv=none; b=faZPQvwGD4yg9sj6qlXkt5D2KDtjRrrvlBbiGFBVzkV7sBmfVE9/lF3tdGTxscfogsXJ7rXYhQn9G/ombkFDuJ4BGzkEvHonHrUOTHe5n9wLXShz8rkyrIEEm5x2KppXZESK81ZbrMGZgEnj8BusXI+g/RWyPIe1jSwyW6bm8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939905; c=relaxed/simple;
	bh=dp5TXBiDu+vK4NhHATnAX3a+wpecLWfNEQc3Apzs7i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W78aj4hSyB6gJixbCHsZ3PjrVUSpZdTYvGZg9nZuRqONw4flzi2li8N6tfy7uUswm3BPvyN8bNK1DUtgbM8qHMS3xVXKyKWM15O8PQM+p6OZ3NGbZhL8zJamNpDrvhILmwmg8oizeFSKvt1VrI/qbM61p0k9k31u82HhOduwx3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iv6+cWyO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BAAC19424;
	Thu, 19 Mar 2026 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773939905;
	bh=dp5TXBiDu+vK4NhHATnAX3a+wpecLWfNEQc3Apzs7i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iv6+cWyOCRLbOqlRnp3hXQJEjDZGLaAjmgz/CeEaHpG1cEfd8eYys8Wblh3Wr11+A
	 k03QXjcb20gVQGEBAiVAsIwL5Xr/137DDU9GABRiuwFbEEbtFH//BjlL/GpmH3HTfz
	 xg6y/PdZBVGRNXkYuhgSUt86vhChxbrk6Cha0G/j0I7GC+ILLAWsqB//7XrgIBWR3b
	 UK2QN+QfPV7Ig22C+rE2q3OkeY/9GwDYjMKKAdhWltSBcWhW/JB+xeznWkbzGYX1kN
	 NX/HKKCJkJBwOiw+no8ULxPUt7m4MPLg9s8QIclN8evMHfzI/z5B/Nc1c9tnt6mFWd
	 XLyLp1FSeXo6A==
Date: Thu, 19 Mar 2026 10:05:03 -0700
From: Drew Fustini <fustini@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <abwsv3t1jdWJ7sZf@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12532-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,redhat.com,maxlinear.com,vger.kernel.org,lists.infradead.org,icenowy.me,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C97B22CFCAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:55:05AM -0700, Guenter Roeck wrote:
> On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > them A and C coefficients and calls H coefficient in the binding as B)
> > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > respectively), however the binding currently only allows coefficients as
> > precise as 100 milli-Celsius (1/10 degree Celsius).
> > 
> > Change the multipleOf value of these two coefficients to 10 (in the unit
> > of milli-Celsius) to satisfy the need of TH1520.
> > 
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Applied.
> 
> Thanks,
> Guenter

Hi, what branch is it applied to? I don't see it in next-20260319, so
I'm thinking I should wait on the dts patch.

Thanks,
Drew


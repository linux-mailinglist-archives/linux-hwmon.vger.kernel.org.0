Return-Path: <linux-hwmon+bounces-15432-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wrtTKUbZQmrNEgoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15432-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:44:54 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 443266DEB10
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:44:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="jTAA9/eA";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15432-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15432-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02E123037149
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 20:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D9939184C;
	Mon, 29 Jun 2026 20:44:33 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921D3909A7
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:44:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765873; cv=none; b=dYSSKUbACOJj0whSlXsWqvVIGTo0zGNrIFr8FlBPAlmrcW44Kk4mZ4MBD/UJ299qF5iTdwellobpsNflRk8pVJJ8+2m7cMLXxlyBMoAbYrS2IS/V8e1DQlMvvWZzuxNJqHWuoNWaL2bnpqaqYHOLemCQi1ThZ7tLdNhn1sietJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765873; c=relaxed/simple;
	bh=qLswO6PbGdjO+PSXY5dBfemfJFcC+c3Wq5lpcW7TGZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeZSMGm9NHcIah2AODpVoOX2JY2ojb9fx695gosrxtwCRP7LfoApWsKFXf6udKlNplnUoUrLHRnYGV9+wkwM+7MB4u6iwx/BEbpBmCxELAyXDrHGefHyqrCraMvxvC9wxo003cPaAjbwVQZR6LAuAmBNIBDVWOMjjxjkZ4lTbXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTAA9/eA; arc=none smtp.client-ip=74.125.82.45
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-139b5e604b9so4419896c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765871; x=1783370671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6f4NvAzvRx5tjxcWHn6nP6qFeKXFgm3axRSQP1raDs=;
        b=jTAA9/eAO9DN5etagyY0FRqDsfKUTLM2LJOKWiyv/JVn/OrFHuDOV1R9E9rJO+bGvQ
         Nq2kRc7x9l/zJXYaHfgKPNiEWI1jT7qwqfYUvsis7X0d1AjUUgSPVETctjaSDEU9AImd
         7KdqZX045YNV+Td52OWi2n1P+SsygatmqyIsdF52YxoV3u7DF2kK1NG07I5tV6x4D1gC
         RZp6UcDPFhhERK8VmQQlaoh9aI5/cdeJN/wNzRxmUafBbJ+BVvXH51dBsLE/m4psUTD8
         MpVPiWciuVW2c4C0pq+v7l+uF17C0FoaUYrjkEKLfVyGPilV70wKRN7Sig+lkLiTDSqs
         dzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765871; x=1783370671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6f4NvAzvRx5tjxcWHn6nP6qFeKXFgm3axRSQP1raDs=;
        b=e7vecX5zB48U5LUNZvaPYAg6AZSvohTKIDygt02ncN167u5r9ZfHQPwraolk28eqxn
         kLktJQCiH5QCp6khcifvFgtuXcvxHilOc7mbyuYUFbk+/NDZY6PobH1vWLL+Lr9nk5yC
         fCdROznQohZyYWTo0p+FRJbSZsOML+Uw8W26mw+Ypw7rHYWeeGSeDu88NAbOaqZTvpM6
         idcvt1xdPvtQF7iR0kPciKO+8knjkg6mn/EkwR3NfMwvdOg23NvRYetxU8/BPTJDRzpd
         2ObKMdHlsdYuHtxi4r8fuQDsVSVJS1gal0Op9kzX7F787iKitFXRb1NbNCOVHGKy6osf
         tD+w==
X-Forwarded-Encrypted: i=1; AFNElJ89mODczaZ2SMtBn98CcclSudznHU5GV4R+YFFtmb15aNsWRlSck7ldJcBUY93YXfrqTqp5op+HjEgTQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3RZdsOFJ1H6rPfodQUBgXu6APenPvs2vy4F5sImXd7juR+EuN
	x3PHqcRpZgs5vmlYFKn+olhqMBYfz2bzF1AwtTH+0cLwkhjy3yiiCVTI
X-Gm-Gg: AfdE7cmkVge2UkXzH3/4fz3uUN8Pw0p7uEpAT2Elz5ugEg88dcp6F8/SrRrwCNWwWHs
	IHQdY8j5hzLJiARr6O7O43PliTPsucLqf+kQ134PtzSz3taRxIDPzuyummzIy5NsuR5AAw4B1P5
	tvXVHAr26WB74qhCJfbZSVwkasD5+2s433q9wgAXG7gnOwDK+gGJlP+y831UaYDqtPmnr+78kBf
	r93joexGuhkYhCKlWRK1mHlQC52hJnhPRPBDKzI96SwokLh3/fughaSDag6GTjPCThAOcfpiv9a
	Z0RLwGXtg8dkR0FvrqgLF2X8Az3bokwPL45Nw2VlvdF+kCChTd0NZb8gSKWw3fP5pBbTrHqFSnq
	/f7oeRO+tixSLm4SRCkCIav0xLC0Kfz06F7SpHw8cOMEwa85/gsbaXiZDvQRuPyJJPZ29so5pXh
	UNHAH6xd8IJmQMObzj6ASyyoBztwAMHOatZhgg
X-Received: by 2002:a05:7022:4595:b0:137:546:9e9d with SMTP id a92af1059eb24-13b2a1c0848mr507073c88.23.1782765871336;
        Mon, 29 Jun 2026 13:44:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab30047sm844786c88.8.2026.06.29.13.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:44:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:44:30 -0700
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
Subject: Re: [PATCH v2 1/9] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
Message-ID: <5ff613e7-5176-4e1b-9400-1db4fd93add0@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15432-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 443266DEB10

On Fri, Jun 26, 2026 at 10:21:42AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Support ROHM BD12780 and BD12780A hot-swap controllers, which are largely
> compatible with the Analog Devices adm1278. Main difference between
> the BD12780 and the BD12780A is, that the BD12780 has one I2C address
> configuration pin more (ADDR3) than the BD12780A.
> 
> Introduce own compatibles for both variants but require the BD12780A to
> always have the BD12780 as a fall-back.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter


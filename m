Return-Path: <linux-hwmon+bounces-14979-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xM5/ESfAKWrjcgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14979-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 21:51:03 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019866C968
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 21:51:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TquLqj9a;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14979-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14979-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC3C313F719
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 19:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E891730C629;
	Wed, 10 Jun 2026 19:50:32 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016A3438A2
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 19:50:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121032; cv=none; b=OzKQi6tV67kSpy5ufEGr0qwJ1VRNAqYArueTvlrhcKjCQOx8EbJu3dXZJa9gSwVj1dZdKbcL6Qgq6XCFn2ucyQiKWyeK8xHzhl6bXTnrffvez4LJceG7WgjI0ha9e+Rfia4xaRZxP7R+sr3qZp9+9BuLpLhvfu5IAeOV2Vbu3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121032; c=relaxed/simple;
	bh=NdoR2dUOz+cvRTVp6dzp5eO0K7yE82vTXhrdPrgb+7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0tVGtQdUSumjsu1kajSr78/gKTIb2kNw2P9VbeNWYHSSzuMhIHc/nGlcx+eu1+PxkEG0IGCoumqn3cvs2mg52eWxsmBs/ymz+/RCEZeLvbsJDz3gWEHQ/WjCqQvG+yvT0dt9hamRRlpyLE4nG6lb9TBGNWngkzaTBh3r5VNQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TquLqj9a; arc=none smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-306f36df4feso186959eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781121031; x=1781725831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AE+2DETC16XLEWZxUW4XVA4+dACVsOVOfwIUzPMRy7Q=;
        b=TquLqj9a3Y8qCGW+oxPw2IUauU6GdiR+/BPbr7wSa9q18MaQL0XoM0NQCVP6KcU1W2
         GqthVJz299q23fApFLZGeLXpgl+e6oO/dWpo5j4LE4HbQaXkN0dp40I4RYSHbbZmDpwK
         GlP+BPCuEjG5rTOt0iAt/nz9PKy3bEGTLQVfNALxqYB8YrBaqyhW97H1mCE1TdILEXbN
         /Y4lhOoG0eZn25sR8iIexmP+xHDfgjoXTmNYanDsnNEQUzHT0dBjMUfgfOOHPtcMmVcI
         lnnsQTJAALFxqyaDGbpUf7wSz2/KOM0z/jnsoeRapHA/XU/j+/9NtkAccMBiP8fvN/iF
         MOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781121031; x=1781725831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AE+2DETC16XLEWZxUW4XVA4+dACVsOVOfwIUzPMRy7Q=;
        b=ebNqfGpPXHWOMJ9sQPFsxCCeA+eLlf3/kR4WyhF9jBpajRcpPPGTJlV33/NOtP5eZP
         ubaq7AboWfL8wK2lo+bpcZzUfyVbT8bHgy25l3Ch5X0kBlgVtEx5MnlrbD3gr17OMJll
         MKNN2GSgxIak0LBS5UNgwFfZ4ODnK71F7vSxaSV52maMgslAZCp/ToErQIOb/JY5nlvJ
         x0HHlHVMe1z1+uBs+/FOFkN8CBeUCigJB+TQsS38g1VtEhAJHttQBvpUuuUzAw2uVsZ5
         CaniahXg6s9M8xRnKyjaIW7iK4lkuL1Oqv+u9nU2q2yEifl8GmT2bQYVzAh/kWbhrHgc
         y+cA==
X-Forwarded-Encrypted: i=1; AFNElJ/lSxA6mydxExOxUPT1i/G5GygSr6yqXDa0LWqJOnI2oomOF9ItDoMZB0uOiJ9gnxMA63zfSMKZWkZJfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtnVYHz1bCWTxjXsiBMkKhhLlQRLZ7gKSByfmz993PXtubAxD
	d31xTlUdBxIkg3vSgZ2xiAL1ok8l4tbKZBj7lPFjENG3rJ2dzTXy071Z
X-Gm-Gg: Acq92OGZY9F38FIKzPtUeeC5fkD3jnoNVbSzkXqXYG+CYRQlBrmOBUde+S8dt00WVq+
	aZ0Oc3H9RAaTFENY4G+iVmolYUabmT9GqS55GyowZLQcznnq4lCFDcpYwfojiQA6GplbwZq/7sd
	1nAzNe6gHA19MbprKvBtIFIw500SsdeRUhQfwn2NR28TR9lSrT29YvwZLOwSh43m6kgyrdnaTUQ
	ye5ODD/dgFOLPZhcLht8GXdqVa4k9pst8wQ+FpzAwLSH/uU0xPKOrYRSN4EHI9GD46zXQfIfywm
	H7RJlYo+4t7czcWcNSpHj9XQRHdlifCJPWwvjEjt13Eswwf1mT6z7+FlvF0jDnefUhDQD0jjTv1
	7xMmdqGO/1gknJZldFdgBACsEU6vjSvFJq+TTGDa9DyJDFxeOD7YFoMTn++64xyhJ1o4jRyBxTK
	P5Tlk/Vj6AJYYp05Xco5+OhArpFilT4h9iJGQ/JZifXp8K/qk=
X-Received: by 2002:a05:7301:e0c1:b0:2d2:d5a3:e97c with SMTP id 5a478bee46e88-308015d8c77mr47705eec.12.1781121030827;
        Wed, 10 Jun 2026 12:50:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e76sm25662344eec.18.2026.06.10.12.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:50:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:50:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <2cc27856-725b-492e-bce9-f1208a89fd4c@roeck-us.net>
References: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
 <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14979-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marius.cristea@microchip.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,roeck-us.net:from_mime,vger.kernel.org:from_smtp,microchip.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9019866C968

On Wed, Jun 10, 2026 at 06:19:47PM +0300, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels,
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Applied.

Thanks,
Guenter

